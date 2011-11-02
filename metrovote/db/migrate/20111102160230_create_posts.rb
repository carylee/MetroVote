class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :message
      t.string :source
      t.string :picture
      t.string :link
      t.string :name
      t.string :caption
      t.string :icon
      t.string :type
      t.string :post_id
      t.text :description
      t.boolean :is_endorsement
      t.boolean :is_reply
      t.datetime :posted_at
      t.string :from_name
      t.string :from_id
      t.integer :candidate_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
