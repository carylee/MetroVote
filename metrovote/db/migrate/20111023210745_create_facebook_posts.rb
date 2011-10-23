class CreateFacebookPosts < ActiveRecord::Migration
  def self.up
    create_table :facebook_posts do |t|
      t.text :message
      t.string :picture
      t.string :link
      t.string :name
      t.string :caption
      t.string :icon
      t.string :type
      t.text :description
      t.datetime :created_time
      t.string :post_id
      t.string :name
      t.string :from_name
      t.string :from_id
      t.integer :candidate_id

      t.timestamps
    end
  end

  def self.down
    drop_table :facebook_posts
  end
end
