class Election < ActiveRecord::Base
  has_many :positions

  def article_sources
    return Article.find_by_sql("select source,host from articles group by source")
  end
end
