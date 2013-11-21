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

ActiveRecord::Schema.define(version: 20131120235704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parking_codes", force: true do |t|
    t.integer  "code"
    t.date     "codedate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_data", force: true do |t|
    t.string   "message_sid"
    t.string   "sms_sid"
    t.string   "account_sid"
    t.string   "text_to"
    t.string   "text_from"
    t.string   "text_body"
    t.string   "num_media"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "text_success"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "company"
    t.string   "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
