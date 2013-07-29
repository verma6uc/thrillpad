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

ActiveRecord::Schema.define(version: 20130726224221) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "bookings", force: true do |t|
    t.string   "activity_id",      limit: 4
    t.string   "user_id",          limit: 4
    t.string   "start_time"
    t.integer  "number_of_people"
    t.string   "date"
    t.string   "amount_status"
    t.string   "is_confirmed"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "cities", force: true do |t|
    t.string   "title"
    t.integer  "state_id"
    t.integer  "pin_start"
    t.integer  "pin_end"
    t.string   "map"
    t.text     "description"
    t.text     "history"
    t.string   "slug"
    t.boolean  "is_featured"
    t.boolean  "is_created"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "countries", force: true do |t|
    t.string   "ccode"
    t.string   "currency"
    t.string   "currency_code"
    t.string   "title"
    t.string   "map"
    t.text     "description"
    t.text     "history"
    t.string   "slug"
    t.boolean  "is_featured"
    t.boolean  "is_created"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "hotel_facilities", force: true do |t|
    t.integer  "hotel_id"
    t.boolean  "hr_room_service"
    t.boolean  "airport_transfer"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "valet_parking"
    t.boolean  "car_park"
    t.boolean  "parking"
    t.boolean  "lan_access"
    t.boolean  "free_wifi_access"
    t.boolean  "internet_in_rooms"
    t.boolean  "water_sports_non_motorized"
    t.boolean  "water_sports_motorized"
    t.boolean  "tennis_courts"
    t.boolean  "steamroom"
    t.boolean  "squash_courts"
    t.boolean  "spa"
    t.boolean  "sauna"
    t.boolean  "private_beach"
    t.boolean  "pool_kids"
    t.boolean  "outdoor_pool"
    t.boolean  "massage"
    t.boolean  "kids_club"
    t.boolean  "jacuzzi"
    t.boolean  "indoor_pool"
    t.boolean  "hot_spring_bath"
    t.boolean  "golf_course_within_3_km"
    t.boolean  "golf_course_on_site"
    t.boolean  "garden"
    t.boolean  "games_room"
    t.boolean  "fitness_center"
    t.boolean  "sports_and_recreation"
    t.boolean  "wi_fi_in_public_areas"
    t.boolean  "tours"
    t.boolean  "smoking_area"
    t.boolean  "shuttle_service"
    t.boolean  "shops"
    t.boolean  "salon"
    t.boolean  "safety_deposit_boxes"
    t.boolean  "room_service"
    t.boolean  "restaurant"
    t.boolean  "poolside_bar"
    t.boolean  "pets_allowed"
    t.boolean  "nightclub"
    t.boolean  "meeting_facilities"
    t.boolean  "laundry_service_dry_cleaning"
    t.boolean  "family_room"
    t.boolean  "executive_floor"
    t.boolean  "elevator"
    t.boolean  "disabled_facilities"
    t.boolean  "concierge"
    t.boolean  "coffee_shop"
    t.boolean  "casino"
    t.boolean  "business_center"
    t.boolean  "bicycle_rental"
    t.boolean  "bar_pub"
    t.boolean  "babysitting"
  end

  create_table "hotel_rooms", force: true do |t|
    t.integer  "hotel_id"
    t.string   "title"
    t.string   "image1"
    t.string   "image2"
    t.integer  "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "hotels", force: true do |t|
    t.string   "title"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.text     "description"
    t.text     "address"
    t.integer  "city_id"
    t.string   "map"
    t.integer  "number_of_rooms"
    t.string   "check_out"
    t.text     "hotel_policies"
    t.string   "slug"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.string   "star_rating"
  end

  create_table "places", force: true do |t|
    t.string   "title"
    t.integer  "city_id"
    t.string   "map"
    t.text     "description"
    t.text     "history"
    t.string   "slug"
    t.boolean  "is_featured"
    t.boolean  "is_created"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: true do |t|
    t.string   "scode"
    t.string   "title"
    t.integer  "country_id"
    t.string   "map"
    t.text     "description"
    t.text     "history"
    t.string   "slug"
    t.boolean  "is_featured"
    t.boolean  "is_created"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tp_activities", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "slug"
    t.integer  "price"
    t.text     "tags"
    t.integer  "city_id"
    t.integer  "user_id"
    t.boolean  "is_featured"
    t.boolean  "is_approved"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trip_entries", force: true do |t|
    t.integer  "entity_id"
    t.integer  "trip_id"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.string   "entity_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_hotels", force: true do |t|
    t.integer  "hotel_id"
    t.integer  "hotel_room_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "slug"
    t.string   "phone_number"
    t.string   "address"
    t.string   "avatar"
    t.text     "bio"
    t.boolean  "is_host"
    t.boolean  "is_agency"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["votable_id", "votable_type"], name: "index_votes_on_votable_id_and_votable_type", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type"], name: "index_votes_on_voter_id_and_voter_type", using: :btree

end
