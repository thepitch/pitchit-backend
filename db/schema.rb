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

ActiveRecord::Schema.define(version: 20151008235929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "pitch_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["pitch_id"], name: "index_comments_on_pitch_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "external_links", force: :cascade do |t|
    t.string   "url"
    t.integer  "linkable_id"
    t.string   "linkable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pitches", force: :cascade do |t|
    t.string   "title"
    t.string   "tagline"
    t.string   "description"
    t.string   "media"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pitches", ["user_id"], name: "index_pitches_on_user_id", using: :btree

  create_table "subcomments", force: :cascade do |t|
    t.string   "content"
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subcomments", ["comment_id"], name: "index_subcomments_on_comment_id", using: :btree
  add_index "subcomments", ["user_id"], name: "index_subcomments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "password_hash",          default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "blurb"
    t.string   "user_type"
    t.string   "company"
    t.string   "picture_url"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  # add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.boolean  "bookmarked",   default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
