require 'twitter'
require 'rbing'

class Candidate < ActiveRecord::Base
  belongs_to :position
  has_many :tweets
  has_many :posts
  has_many :articles

  def get_tweets
    if self.twitter != ""
      Twitter.user_timeline(self.twitter).each do |tweet|
        #created = DateTime.parse(tweet.created_at)
        created = tweet.created_at
        if tweet.in_reply_to_user_id.nil?
          unless Post.exists?(:post_id=>tweet.id, :source=>'twitter', :candidate_id => self.id)

            #get_urls_from_text(tweet.text).each do |url|
              #add_article_by_url(url)
            #end

            @t = Post.new(:message => tweet.text,
                           :source => 'twitter',
                           :picture => tweet.user.profile_image_url,
                           #:name => '',
                           #:caption => '',
                           :icon => tweet.user.profile_image_url,
                           #:type => '',
                           #:description => '',
                           :posted_at => created,
                           :post_id => tweet.id_str,
                           :is_endorsement => has_endorsement(tweet.text),
                           :is_reply => false,
                           :candidate_id => self.id,
                           :from_id => tweet.user.id,
                           :from_name => tweet.user.screen_name)
            @t.save
          end
        end
      end
    end
  end

  def add_article_by_url(url)
    unless url == ''
      logger.debug(url)
      obj = get_link_info(url)
      obj.title
      unless Article.exists?(:url=>obj.url, :candidate_id=>self.id)
        @a = Article.new(:title => obj.title,
                         :snippet => obj.description,
                         :url => obj.url,
                         :date => Time.now,
                         :source => get_source_from_url(obj.url),
                         :candidate_id => self.id)
        @a.save
      end
    end
  end

  def get_fb_posts
    token = "AAADEvdySPLsBAFyCj39cLJFpW8aAAXnr1R5ZCrlZAY2aSlBhrj8BVAGI32TS1eVxEQZC4jZABKZCzyUgZARob2K33YBDxgMVsZD"
    @graph = Koala::Facebook::API.new(token)
    feed = @graph.get_connections(self.class.parse_facebook_url(self.facebook), "feed")
    feed.each do |post|
      created = DateTime.parse(post['created_time'])
      unless Post.exists?(:post_id=>post['id'], :source=>'facebook', :candidate_id => self.id)
        #unless post['link'].nil? or post['link'] == ''
          #add_article_by_url post['link']
        #end

        @p = Post.new(:message => post['message'],
                              :source => 'facebook',
                              :picture => post['picture'],
                              :link => post['link'],
                              :name => post['name'],
                              :caption => post['caption'],
                              :icon => post['icon'],
                              :type => post['type'],
                              :description => post['description'],
                              :posted_at => created,
                              :post_id => post['id'],
                              :is_endorsement => has_endorsement(post['message']),
                              :is_reply => false,
                              :candidate_id => self.id,
                              :from_id => post['from']['id'],
                              :from_name => post['from']['name'])
        @p.save
      end
    end
  end

  def self.get_facebook_info(fb)
    token = "AAADEvdySPLsBAFyCj39cLJFpW8aAAXnr1R5ZCrlZAY2aSlBhrj8BVAGI32TS1eVxEQZC4jZABKZCzyUgZARob2K33YBDxgMVsZD"
    @graph = Koala::Facebook::API.new(token)
    return @graph.get_object(self.parse_facebook_url(fb))
  end

  def get_source_from_url(url)
    uri = URI::parse(url)
    @a = Article.find_by_host(uri.host)
    return @a.source
  end

  def self.parse_facebook_url(url)
    return URI::split(url)[5].split('/')[-1]
  end

  def get_urls_from_text(text)
    p = URI::Parser.new
    return p.extract(text)
  end

  def get_link_info(url)
    embedly_api = Embedly::API.new :key => '27b50eca033711e1b1d14040d3dc5c07',
                                   :caryme => 'Mozilla/5.0 (compatible; metrovote; caryme@gmail.com)'
    obj = embedly_api.oembed :urls => url
    return obj[0]
  end

  def get_articles
    bing = RBing.new("E08C094B36831A4E20810A668B43265D1941F8FE")
    rsp = bing.news(self.name + " " + self.position.election.keyword)
    if rsp.key? 'News'
      rsp.news.results.each do |article|
        created = DateTime.parse(article.Date)
        uri = URI::parse(article.Url)
        logger.debug(article)
        unless Article.exists?(:title=>article.Title, :source => article.Source, :candidate_id=>self.id)
          @a = Article.new(:title => article.Title,
                           :snippet => article.Snippet,
                           :url => article.Url,
                           :date => created,
                           :host => uri.host,
                           :source => article.Source,
                           :candidate_id => self.id)
          @a.save
        end
      end
    end
  end

  def has_endorsement(text)
    return !/endors/i.match(text).nil?
  end

  def fetch_data
    get_articles
    get_tweets
    get_fb_posts
  end

  def feed
    return Post.where("candidate_id=#{self.id} AND message != ''")
  end

  def endorsements
    return Post.where(:candidate_id => self.id, :is_endorsement=>true)
  end

  def self.fetch_tweets
    self.find_each {|c| c.get_tweets}
  end

  def self.fetch_articles
    self.find_each {|a| a.get_articles}
  end

  def self.fetch_fb_posts
    self.find_each {|c| c.get_fb_posts}
  end

  def self.fetch_data
    self.find_each do |candidate|
      candidate.get_articles
      candidate.get_tweets
      candidate.get_fb_posts
    end
  end

end
