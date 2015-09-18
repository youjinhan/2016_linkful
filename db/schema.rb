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

ActiveRecord::Schema.define(version: 20150907102202) do

  PRAGMA FOREIGN_KEYS = ON;
  create_table "tags", force: :cascade do |t|
    t.string   "tagName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "userId"
    t.string   "userName"
    t.string   "userPw"
    t.string   "reset_password_token"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "urls", force: :cascade do |t|
    t.integer  "user_id",    foreign_key: {references: "users", name: "fk_urls_user_id", on_update: :no_action, on_delete: :no_action}, index: {name: "fk__urls_user_id"}
    t.integer  "category"
    t.string   "urlTitle"
    t.string   "urlLink"
    t.text     "memo"
    t.string   "tagFirst",   default: "--- []\n"
    t.integer  "star"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_urls", force: :cascade do |t|
    t.integer  "url_id",     foreign_key: {references: "urls", name: "fk_tags_urls_url_id", on_update: :no_action, on_delete: :no_action}, index: {name: "fk__tags_urls_url_id"}
    t.integer  "tag_id",     foreign_key: {references: "tags", name: "fk_tags_urls_tag_id", on_update: :no_action, on_delete: :no_action}, index: {name: "fk__tags_urls_tag_id"}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
