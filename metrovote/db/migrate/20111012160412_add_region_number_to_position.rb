class AddRegionNumberToPosition < ActiveRecord::Migration
  def self.up
    add_column :positions, :region_number, :integer
  end

  def self.down
    remove_column :positions, :region_number
  end
end
