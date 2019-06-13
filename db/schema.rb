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

ActiveRecord::Schema.define(version: 2019_06_13_145359) do

  create_table "adventures", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hero_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "little_sister", default: false
    t.integer "experience_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.integer "xp", default: 5
    t.integer "hp_rating", default: 3
    t.integer "treasure_rating", default: 2
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.boolean "healing", default: false
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.integer "hp", default: 5
    t.integer "treasure", default: 0
    t.integer "total_xp", default: 0
    t.boolean "incapacitated", default: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
