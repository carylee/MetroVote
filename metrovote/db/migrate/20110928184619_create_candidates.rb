class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :name
      t.text :bio
      t.string :photo
      t.string :website
      t.string :email
      t.string :position
      t.string :twitter
      t.string :facebook

      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
