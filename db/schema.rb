# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.
ActiveRecord::Schema[7.0].define(version: 2022_11_08_155310) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circle_events", force: :cascade do |t|
    t.bigint "circle_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_circle_events_on_circle_id"
    t.index ["event_id"], name: "index_circle_events_on_event_id"
  end

  create_table "circle_messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "circle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_circle_messages_on_circle_id"
    t.index ["user_id"], name: "index_circle_messages_on_user_id"
  end

  create_table "circles", force: :cascade do |t|
    t.string "name"
    t.boolean "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_messages_on_event_id"
    t.index ["user_id"], name: "index_event_messages_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.boolean "private"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "user_circles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "circle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_user_circles_on_circle_id"
    t.index ["user_id"], name: "index_user_circles_on_user_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "circle_events", "circles"
  add_foreign_key "circle_events", "events"
  add_foreign_key "circle_messages", "circles"
  add_foreign_key "circle_messages", "users"
  add_foreign_key "event_messages", "events"
  add_foreign_key "event_messages", "users"
  add_foreign_key "events", "users"
  add_foreign_key "user_circles", "circles"
  add_foreign_key "user_circles", "users"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
end
