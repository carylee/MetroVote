class AddIsIncumbentToCandidates < ActiveRecord::Migration
  def self.up
    add_column :candidates, :is_incumbent, :boolean
  end

  def self.down
    remove_column :candidates, :is_incumbent
  end
end
