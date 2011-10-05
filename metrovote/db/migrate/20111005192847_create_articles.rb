class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.string :source
      t.datetime :date
      t.text :snippet
      t.integer :candidate_id

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
