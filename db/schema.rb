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

ActiveRecord::Schema.define(version: 20160427174808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "about"
    t.string   "category"
    t.string   "password_digest"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

  create_table "requests", force: :cascade do |t|
    t.date     "tour_date"
    t.integer  "user_id"
    t.integer  "provider_id"
    t.integer  "tour_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "requests", ["provider_id"], name: "index_requests_on_provider_id", using: :btree
  add_index "requests", ["tour_id"], name: "index_requests_on_tour_id", using: :btree
  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "scheduleds", force: :cascade do |t|
    t.date     "tour_date"
    t.integer  "user_id"
    t.integer  "provider_id"
    t.integer  "tour_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "scheduleds", ["provider_id"], name: "index_scheduleds_on_provider_id", using: :btree
  add_index "scheduleds", ["tour_id"], name: "index_scheduleds_on_tour_id", using: :btree
  add_index "scheduleds", ["user_id"], name: "index_scheduleds_on_user_id", using: :btree

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.integer  "provider_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "tour_pic_file_name"
    t.string   "tour_pic_content_type"
    t.integer  "tour_pic_file_size"
    t.datetime "tour_pic_updated_at"
  end

  add_index "tours", ["provider_id"], name: "index_tours_on_provider_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "first_name"
    t.string   "city"
    t.string   "country"
    t.string   "email"
    t.text     "about"
    t.string   "password_digest"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

  add_foreign_key "requests", "providers"
  add_foreign_key "requests", "tours"
  add_foreign_key "requests", "users"
  add_foreign_key "scheduleds", "providers"
  add_foreign_key "scheduleds", "tours"
  add_foreign_key "scheduleds", "users"
  add_foreign_key "tours", "providers"
end
