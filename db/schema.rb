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

ActiveRecord::Schema.define(version: 2018_10_15_161726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "state_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhood_post_likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "neighborhood_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["neighborhood_post_id"], name: "index_neighborhood_post_likes_on_neighborhood_post_id"
    t.index ["user_id"], name: "index_neighborhood_post_likes_on_user_id"
  end

  create_table "neighborhood_posts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "neighborhood_id"
    t.string "post"
    t.string "image"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["neighborhood_id"], name: "index_neighborhood_posts_on_neighborhood_id"
    t.index ["user_id"], name: "index_neighborhood_posts_on_user_id"
  end

  create_table "neighborhood_replies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "neighborhood_post_id"
    t.string "reply"
    t.string "image"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["neighborhood_post_id"], name: "index_neighborhood_replies_on_neighborhood_post_id"
    t.index ["user_id"], name: "index_neighborhood_replies_on_user_id"
  end

  create_table "neighborhood_reply_likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "neighborhood_reply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["neighborhood_reply_id"], name: "index_neighborhood_reply_likes_on_neighborhood_reply_id"
    t.index ["user_id"], name: "index_neighborhood_reply_likes_on_user_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.bigint "town_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["town_id"], name: "index_neighborhoods_on_town_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "country_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "towns", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.string "postcode"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_towns_on_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", limit: 32
    t.string "last_name", limit: 32
    t.bigint "neighborhood_id"
    t.bigint "town_id"
    t.bigint "city_id"
    t.bigint "state_id"
    t.bigint "country_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["neighborhood_id"], name: "index_users_on_neighborhood_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["state_id"], name: "index_users_on_state_id"
    t.index ["town_id"], name: "index_users_on_town_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
