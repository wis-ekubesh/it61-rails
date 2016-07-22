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

ActiveRecord::Schema.define(version: 20160720130625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "url"
    t.string   "logo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_companies_on_name", using: :btree
  end

  create_table "event_participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["event_id"], name: "index_event_participations_on_event_id", using: :btree
    t.index ["user_id"], name: "index_event_participations_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",                                         null: false
    t.text     "description",                                   null: false
    t.string   "title_image"
    t.integer  "organizer_id",                                  null: false
    t.boolean  "published",                     default: false
    t.datetime "published_at"
    t.boolean  "subscribers_notification_send", default: false
    t.datetime "started_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registration_type",             default: 0
    t.integer  "participants_limit"
    t.string   "link"
    t.index ["organizer_id"], name: "index_events_on_organizer_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "place_id"
    t.string   "extra_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "place_id", "extra_info"], name: "index_locations_on_event_id_and_place_id_and_extra_info", unique: true, using: :btree
  end

  create_table "participant_entry_forms", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "event_id",    null: false
    t.text     "reason",      null: false
    t.string   "profession",  null: false
    t.text     "suggestions"
    t.integer  "confidence",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id", "event_id"], name: "index_participant_entry_forms_on_user_id_and_event_id", unique: true, using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "address",    null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_places_on_address", using: :btree
    t.index ["title", "address", "latitude", "longitude"], name: "index_places_on_title_and_address_and_latitude_and_longitude", unique: true, using: :btree
    t.index ["title"], name: "index_places_on_title", using: :btree
  end

  create_table "social_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "link"
    t.index ["user_id"], name: "index_social_accounts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: ""
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name"
    t.integer  "role",                default: 0,  null: false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "phone"
    t.string   "normalized_phone"
    t.boolean  "email_reminders",                  null: false
    t.boolean  "sms_reminders",                    null: false
    t.boolean  "subscribed",                       null: false
    t.string   "remember_token"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["email_reminders"], name: "index_users_on_email_reminders", using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["sms_reminders"], name: "index_users_on_sms_reminders", using: :btree
    t.index ["subscribed"], name: "index_users_on_subscribed", using: :btree
  end

end
