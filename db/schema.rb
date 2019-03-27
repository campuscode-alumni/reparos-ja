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

ActiveRecord::Schema.define(version: 2019_03_26_234208) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contractor_profile_sub_categories", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_contractor_profile_sub_categories_on_profile_id"
    t.index ["sub_category_id"], name: "index_contractor_profile_sub_categories_on_sub_category_id"
  end

  create_table "contractor_profiles", force: :cascade do |t|
    t.integer "contractor_id"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractor_id"], name: "index_contractor_profiles_on_contractor_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "cpf"
    t.integer "category_id"
    t.index ["category_id"], name: "index_contractors_on_category_id"
    t.index ["email"], name: "index_contractors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_contractors_on_reset_password_token", unique: true
  end

  create_table "estimates", force: :cascade do |t|
    t.text "description"
    t.string "location"
    t.date "service_date"
    t.string "day_shift"
    t.integer "contractor_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "total_hours"
    t.decimal "visit_fee"
    t.decimal "material_fee"
    t.decimal "service_fee"
    t.text "material_list"
    t.integer "status"
    t.index ["contractor_id"], name: "index_estimates_on_contractor_id"
    t.index ["user_id"], name: "index_estimates_on_user_id"
  end

  create_table "profile_sub_categories", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_sub_categories_on_profile_id"
    t.index ["sub_category_id"], name: "index_profile_sub_categories_on_sub_category_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "contractor_id"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractor_id"], name: "index_profiles_on_contractor_id"
  end

  create_table "service_orders", force: :cascade do |t|
    t.integer "estimate_id"
    t.date "service_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estimate_id"], name: "index_service_orders_on_estimate_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "user_reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "service_order_id"
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_order_id"], name: "index_user_reviews_on_service_order_id"
    t.index ["user_id"], name: "index_user_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
