require 'twitter'
require 'rbing'

class Candidate < ActiveRecord::Base
  #belongs_to :position
  has_many :tweets
  has_many :posts
  has_many :articles

  def get_tweets
    if self.twitter != ""
      Twitter.user_timeline(self.twitter).each do |tweet|
        created = DateTime.parse(tweet.created_at)
        if tweet.in_reply_to_user_id.nil?
          unless Post.exists?(:post_id=>tweet.id, :source=>'twitter')
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

  def get_fb_posts
    token = "AAADEvdySPLsBAFyCj39cLJFpW8aAAXnr1R5ZCrlZAY2aSlBhrj8BVAGI32TS1eVxEQZC4jZABKZCzyUgZARob2K33YBDxgMVsZD"
    @graph = Koala::Facebook::API.new(token)
    feed = @graph.get_connections(self.class.parse_facebook_url(self.facebook), "feed")
    feed.each do |post|
      created = DateTime.parse(post['created_time'])
      unless Post.exists?(:post_id=>post['id'], :source=>'facebook')
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
    return @graph.get_object(self.class.parse_facebook_url(fb))
  end

  def self.parse_facebook_url(url)
    return URI::split(url)[5].split('/')[-1]
  end

  def get_articles
    bing = RBing.new("E08C094B36831A4E20810A668B43265D1941F8FE")
    rsp = bing.news(self.name + " " + "seattle")
    if rsp.key? 'News'
      rsp.news.results.each do |article|
        created = DateTime.parse(article.Date)
        unless Article.exists?(:url=>article.Url, :candidate_id=>self.id)
          @a = Article.new(:title => article.Title,
                           :snippet => article.Snippet,
                           :url => article.Url,
                           :date => created,
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
  end

  def feed
    return Post.where("candidate_id=#{self.id} AND message != ''")
  end

  def endorsements
    return Post.where(:candidate_id => self.id, :is_endorsement=>true)
  end

  def self.get_tweets
    self.all.each {|c| c.get_tweets}
  end

  def self.get_articles
    self.all.each {|a| a.get_articles}
  end

  def self.fetch_data
    self.find_each do |candidate|
      candidate.get_articles
      candidate.get_tweets
      candidate.get_fb_posts
    end
  end

end
