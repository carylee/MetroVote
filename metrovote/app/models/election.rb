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
    Article.find_by_sql ["select source,host from articles where candidate_id IN (?) group by source", self.candidate_ids.join(', ')]
  end
end
