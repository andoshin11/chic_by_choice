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

ActiveRecord::Schema.define(version: 20170612114231) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id",                              null: false
    t.integer  "unit_id",                              null: false
    t.integer  "currency_id",                          null: false
    t.float    "price",                                null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "size"
    t.string   "length"
    t.integer  "priority",      default: 0,            null: false
    t.integer  "period",        default: 4,            null: false
    t.date     "event_date",    default: '2017-06-05', null: false
    t.date     "delivery_date", default: '2017-06-05', null: false
    t.date     "return_date",   default: '2017-06-05', null: false
    t.string   "designer_name"
    t.string   "item_name"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["currency_id"], name: "index_cart_items_on_currency_id"
    t.index ["unit_id"], name: "index_cart_items_on_unit_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "iso_code",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorite_lists_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "favorite_list_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "item_id"
    t.index ["favorite_list_id"], name: "index_favorites_on_favorite_list_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "url",        null: false
    t.integer  "category",   null: false
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "category_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.text     "detail"
    t.integer  "currency_id"
    t.float    "hire_price"
    t.float    "retail_price"
    t.integer  "designer_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["designer_id"], name: "index_items_on_designer_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "size",       null: false
    t.string   "length",     null: false
    t.index ["item_id"], name: "index_units_on_item_id"
  end

end
