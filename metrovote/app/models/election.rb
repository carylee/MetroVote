class Election < ActiveRecord::Base
  has_many :positions

  def candidate_ids
    ids = []
    self.positions.each do |position|
      position.candidates.each do |candidate|
        ids.push(candidate.id)
      end
    end
    return ids
  end

  def article_sources
    ids = self.candidate_ids.join(", ").gsub(/(\d+)/,"'\\1'")
    Article.find_by_sql "select source,host,count(source) as count from articles where candidate_id IN (#{ids}) group by source"
  end
end
