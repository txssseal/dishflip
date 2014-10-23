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

ActiveRecord::Schema.define(version: 20141023010340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: true do |t|
    t.string   "street_address"
    t.integer  "zipcode"
    t.string   "city"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

end
