class AddRelationshipToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :candidate_id, :int
  end

  def self.down
    remove_column :tweets, :candidate_id
  end
end
