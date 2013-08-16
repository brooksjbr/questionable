# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130711201228) do

  create_table "answers", force: true do |t|
    t.integer  "question_id",                 null: false
    t.text     "content",                     null: false
    t.string   "unique_id",                   null: false
    t.integer  "user_id",                     null: false
    t.string   "buddy_image_url"
    t.string   "alias"
    t.integer  "votes_count",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["unique_id"], name: "index_answers_on_unique_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "questions", force: true do |t|
    t.string   "title",                       null: false
    t.text     "content",                     null: false
    t.string   "unique_id",                   null: false
    t.integer  "user_id",                     null: false
    t.string   "buddy_image_url"
    t.string   "alias"
    t.integer  "answers_count",   default: 0
    t.integer  "votes_count",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["unique_id"], name: "index_questions_on_unique_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "alias"
    t.string   "buddy_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id",       null: false
    t.integer  "voteable_id",   null: false
    t.string   "voteable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "user_id"], name: "index_votes_on_voteable_id_and_user_id"

end
