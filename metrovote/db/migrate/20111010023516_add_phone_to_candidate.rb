class AddPhoneToCandidate < ActiveRecord::Migration
  def self.up
    add_column :candidates, :phone, :string
  end

  def self.down
    remove_column :candidates, :phone
  end
end
