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

ActiveRecord::Schema.define(version: 20160226170506) do

  create_table "histories", force: :cascade do |t|
    t.integer  "room_id"
    t.float    "max_temperature"
    t.float    "min_temperature"
    t.float    "avg_temperature"
    t.float    "max_humidity"
    t.float    "min_humidity"
    t.float    "avg_humidity"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "histories", ["room_id"], name: "index_histories_on_room_id"

  create_table "measures", force: :cascade do |t|
    t.float    "temperature"
    t.float    "humidity"
    t.integer  "room_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "measures", ["room_id"], name: "index_measures_on_room_id"

  create_table "roles", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.float    "max_winter_temp"
    t.float    "max_summer_temp"
    t.float    "min_winter_temp"
    t.float    "min_summer_temp"
    t.float    "max_summer_humidity"
    t.float    "max_winter_humidity"
    t.float    "min_summer_humidity"
    t.float    "min_winter_humidity"
    t.integer  "session_id"
  end

  add_index "rooms", ["session_id"], name: "index_rooms_on_session_id"
  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id"

  create_table "sessions", force: :cascade do |t|
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.integer  "role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
