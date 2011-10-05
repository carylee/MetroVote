class AddRelationshipToPositions < ActiveRecord::Migration
  def self.up
    add_column :positions, :election_id, :integer
  end

  def self.down
    remove_column :positions, :election_id
  end
end
