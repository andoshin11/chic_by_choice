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

ActiveRecord::Schema.define(version: 20170417185625) do

  create_table "currencies", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "iso_code",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "category_id"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "summary"
    t.text     "detail"
    t.integer  "currency_id"
    t.float    "hire_price"
    t.float    "retail_price"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "unit_images", force: :cascade do |t|
    t.integer  "unit_id"
    t.string   "url",        null: false
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_unit_images_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "currency_id"
    t.string   "quantity"
    t.float    "price",       default: 0.0, null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["currency_id"], name: "index_units_on_currency_id"
    t.index ["item_id"], name: "index_units_on_item_id"
  end

end
