class AddRelationshipToCandidates < ActiveRecord::Migration
  def self.up
    add_column :candidates, :position_id, :integer
  end

  def self.down
    remove_column :candidates, :position_id
  end
end
