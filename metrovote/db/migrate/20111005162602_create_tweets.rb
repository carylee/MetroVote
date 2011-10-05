class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :tweet_id
      t.string :text
      t.datetime :created
      t.text :raw

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
