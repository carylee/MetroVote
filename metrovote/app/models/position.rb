class Position < ActiveRecord::Base
  has_many :candidates
  belongs_to :election

  def articles
    articles = []
    self.candidates.each do |@candidate|
      @candidate.articles.each do |@article|
        articles.push @article
      end
    end
    articles.sort {|a,b| a.date <=> b.date }
    return articles
  end
end
