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

ActiveRecord::Schema.define(version: 2019_01_08_055033) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "date"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.integer "week_id"
    t.boolean "returned"
    t.integer "amount"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_deposits_on_week_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "type"
    t.integer "house_id"
    t.integer "amount"
    t.string "notes"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_expenses_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "info"
    t.integer "value"
    t.integer "purchase_price"
    t.integer "market_value"
    t.integer "total_income"
    t.integer "total_expenses"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "rincome_id"
    t.string "date"
    t.integer "amount"
    t.string "payment_type"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rincome_id"], name: "index_payments_on_rincome_id"
  end

  create_table "renters", force: :cascade do |t|
    t.integer "week_id"
    t.string "name"
    t.string "address"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_renters_on_week_id"
  end

  create_table "rincomes", force: :cascade do |t|
    t.integer "week_id"
    t.integer "payment_id"
    t.integer "amount"
    t.integer "percentPaid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_rincomes_on_payment_id"
    t.index ["week_id"], name: "index_rincomes_on_week_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "image"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "week_renters", force: :cascade do |t|
    t.integer "week_id"
    t.integer "renter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["renter_id"], name: "index_week_renters_on_renter_id"
    t.index ["week_id"], name: "index_week_renters_on_week_id"
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "year_id"
    t.string "date"
    t.boolean "closed?"
    t.integer "misc_charges"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year_id"], name: "index_weeks_on_year_id"
  end

  create_table "years", force: :cascade do |t|
    t.integer "house_id"
    t.integer "year"
    t.integer "total_income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_years_on_house_id"
  end

end
