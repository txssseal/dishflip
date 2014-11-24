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

ActiveRecord::Schema.define(version: 20141124180608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: true do |t|
    t.string   "street_address"
    t.integer  "zipcode"
    t.string   "city"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "area"
  end

  create_table "meals", force: true do |t|
    t.string   "meal_name"
    t.decimal  "meal_price"
    t.string   "cuisine_type"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meal_photo_file_name"
    t.string   "meal_photo_content_type"
    t.integer  "meal_photo_file_size"
    t.datetime "meal_photo_updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "restaurant_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "restaurant_logo_file_name"
    t.string   "restaurant_logo_content_type"
    t.integer  "restaurant_logo_file_size"
    t.datetime "restaurant_logo_updated_at"
    t.string   "email"
    t.string   "website"
    t.string   "facebook"
    t.string   "phone"
  end

  create_table "rests", force: true do |t|
    t.string   "restaurant_name"
    t.string   "meal_name"
    t.integer  "meal_price"
    t.string   "restaurant_area"
    t.string   "restaurant_address"
    t.string   "cuisine_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visitors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
