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

ActiveRecord::Schema[7.0].define(version: 2022_05_05_230622) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendee_responses", force: :cascade do |t|
    t.string "selected"
    t.bigint "attendee_id", null: false
    t.bigint "response_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_attendee_responses_on_attendee_id"
    t.index ["response_id"], name: "index_attendee_responses_on_response_id"
  end

  create_table "attendees", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "api_key"
    t.string "rsvp"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendees_on_event_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "message"
    t.bigint "room_id", null: false
    t.bigint "attendee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_chats_on_attendee_id"
    t.index ["room_id"], name: "index_chats_on_room_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.string "description"
    t.string "location"
    t.datetime "start", precision: nil
    t.datetime "end", precision: nil
    t.string "password_digest"
    t.string "ban_brian"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "polls", force: :cascade do |t|
    t.string "question"
    t.bigint "attendee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_polls_on_attendee_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "text"
    t.bigint "poll_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_responses_on_poll_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendee_responses", "attendees"
  add_foreign_key "attendee_responses", "responses"
  add_foreign_key "attendees", "events"
  add_foreign_key "chats", "attendees"
  add_foreign_key "chats", "rooms"
  add_foreign_key "polls", "attendees"
  add_foreign_key "responses", "polls"
end
