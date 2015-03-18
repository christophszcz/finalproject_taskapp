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

ActiveRecord::Schema.define(version: 20150318212939) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "worker_id"
    t.text     "description"
    t.datetime "date"
    t.datetime "time"
    t.string   "title"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "price",       precision: 8, scale: 2
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "to_id"
    t.integer  "from_id"
    t.integer  "assignment_id"
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "avatar"
    t.string   "crypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
