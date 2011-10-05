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

ActiveRecord::Schema.define(:version => 20111005192847) do

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
  end

  create_table "positions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
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
