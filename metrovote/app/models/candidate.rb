require 'twitter'
require 'rbing'

class Candidate < ActiveRecord::Base
  belongs_to :position

  def get_tweets
    Twitter.user_timeline(self.twitter).each do |tweet|
      created = DateTime.parse(tweet.created_at)
      unless Tweet.exists?(["tweet_id=?", tweet.id_str])
        @t = Tweet.new(:tweet_id => tweet.id_str,
                       :text => tweet.text,
                       :candidate_id => self.id,
                       :created => created_at)
        @t.save
      end
    end
  end

  def get_articles
    bing = RBing.new("E08C094B36831A4E20810A668B43265D1941F8FE")
    rsp = bing.news(self.name + " " + "seattle")
    rsp.news.results.each do |article|
      created = DateTime.parse(article.Date)
      unless Article.exists?(["url=?", article.Url])
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

  def self.get_tweets
    self.all.each {|c| c.get_tweets}
  end

  def self.get_articles
    self.all.each {|a| a.get_articles}
  end

  def self.fetch_data
    self.all.each do |candidate|
      candidate.get_articles
      candidate.get_tweets
    end
  end

end
