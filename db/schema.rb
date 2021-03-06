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

ActiveRecord::Schema.define(version: 20170702125631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "chances", force: :cascade do |t|
    t.integer "kredit_kes"
    t.integer "kredit_refinansiranje"
    t.integer "kredit_stambeni"
    t.integer "kredit_auto"
    t.integer "kredit_evergrin"
    t.integer "kredit_fluo"
    t.integer "kredit_potrosacki"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_chances_on_user_id"
  end

  create_table "factors", force: :cascade do |t|
    t.bigint "chance_id"
    t.string "title"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product"
    t.index ["chance_id"], name: "index_factors_on_chance_id"
  end

  create_table "indicators", force: :cascade do |t|
    t.string "product"
    t.string "name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "loans", force: :cascade do |t|
    t.string "loan_type"
    t.date "purchase_date"
    t.string "status"
    t.integer "amount"
    t.date "repayment"
    t.decimal "interest_rate"
    t.decimal "administrative_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "client_id"
    t.string "name"
    t.string "surname"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chances", "users"
  add_foreign_key "factors", "chances"
  add_foreign_key "loans", "users"
end
