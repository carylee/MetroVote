class Position < ActiveRecord::Base
  has_many :candidates
  belongs_to :election

  def articles
    articles = {}
    self.candidates.each do |candidate|
      candidate.articles.each do |article|
        #articles.push article
        key = article.source + article.title
        if articles.has_key? key
          articles[key].candidates.push(candidate)
        else
          #articles[article.url] = {'candidate'=>[candidate], 'article'=>article}
          article.candidates = [candidate]
          articles[key] = article
        end
      end
    end
    return articles.values.sort {|a,b| b.date <=> a.date }
  end
end
