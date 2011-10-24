# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111023210745) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "source"
    t.datetime "date"
    t.text     "snippet"
    t.integer  "candidate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "photo"
    t.string   "website"
    t.string   "email"
    t.string   "position"
    t.string   "twitter"
    t.string   "facebook"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position_id"
    t.string   "phone"
    t.boolean  "is_incumbent"
  end

  create_table "elections", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.string   "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_posts", :force => true do |t|
    t.text     "message"
    t.string   "picture"
    t.string   "link"
    t.string   "name"
    t.string   "caption"
    t.string   "icon"
    t.string   "type"
    t.text     "description"
    t.datetime "created_time"
    t.string   "post_id"
    t.string   "from_name"
    t.string   "from_id"
    t.integer  "candidate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "election_id"
    t.integer  "region_number"
  end

  create_table "tweets", :force => true do |t|
    t.string   "tweet_id"
    t.string   "text"
    t.datetime "created"
    t.text     "raw"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "candidate_id"
  end

end
