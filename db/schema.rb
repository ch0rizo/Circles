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

ActiveRecord::Schema[7.0].define(version: 2022_11_17_153618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "circle_playlists", force: :cascade do |t|
    t.string "url"
    t.bigint "circle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_circle_playlists_on_circle_id"
  end

  create_table "circles", force: :cascade do |t|
    t.string "name"
    t.boolean "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "border_color", default: "#FFFFFF"
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

  create_table "event_playlists", force: :cascade do |t|
    t.string "url"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_playlists_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.string "location"
    t.boolean "private"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.string "description"
    t.bigint "user_event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_event_id"], name: "index_payments_on_user_event_id"
  end

  create_table "splittees", force: :cascade do |t|
    t.bigint "payment_id", null: false
    t.bigint "user_event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_splittees_on_payment_id"
    t.index ["user_event_id"], name: "index_splittees_on_user_event_id"
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
    t.integer "balance", default: 0
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "circle_events", "circles"
  add_foreign_key "circle_events", "events"
  add_foreign_key "circle_messages", "circles"
  add_foreign_key "circle_messages", "users"
  add_foreign_key "circle_playlists", "circles"
  add_foreign_key "event_messages", "events"
  add_foreign_key "event_messages", "users"
  add_foreign_key "event_playlists", "events"
  add_foreign_key "events", "users"
  add_foreign_key "payments", "user_events"
  add_foreign_key "splittees", "payments"
  add_foreign_key "splittees", "user_events"
  add_foreign_key "user_circles", "circles"
  add_foreign_key "user_circles", "users"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
end
