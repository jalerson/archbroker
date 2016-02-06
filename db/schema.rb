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

ActiveRecord::Schema.define(version: 20141214193041) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "continents", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", force: true do |t|
    t.string   "title"
    t.integer  "server_id"
    t.string   "region_code"
    t.integer  "min_price"
    t.integer  "max_price"
    t.integer  "category_id"
    t.integer  "type_id"
    t.integer  "property_id"
    t.integer  "size_id"
    t.boolean  "appraisal"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["category_id"], name: "index_interests_on_category_id", using: :btree
  add_index "interests", ["property_id"], name: "index_interests_on_property_id", using: :btree
  add_index "interests", ["server_id"], name: "index_interests_on_server_id", using: :btree
  add_index "interests", ["size_id"], name: "index_interests_on_size_id", using: :btree
  add_index "interests", ["type_id"], name: "index_interests_on_type_id", using: :btree
  add_index "interests", ["user_id"], name: "index_interests_on_user_id", using: :btree

  create_table "properties", force: true do |t|
    t.string   "name"
    t.integer  "plan_cost"
    t.integer  "decor_limit"
    t.integer  "security_deposit"
    t.integer  "taxes"
    t.integer  "type_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size_id"
  end

  add_index "properties", ["category_id"], name: "index_properties_on_category_id", using: :btree
  add_index "properties", ["size_id"], name: "index_properties_on_size_id", using: :btree
  add_index "properties", ["type_id"], name: "index_properties_on_type_id", using: :btree

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "sale_id"
    t.boolean  "rating"
    t.text     "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["sale_id"], name: "index_ratings_on_sale_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "regions", force: true do |t|
    t.string   "name"
    t.string   "map"
    t.integer  "continent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regions", ["continent_id"], name: "index_regions_on_continent_id", using: :btree

  create_table "sales", force: true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.integer  "region_id"
    t.integer  "server_id"
    t.string   "title"
    t.integer  "price"
    t.string   "contact_ingame"
    t.boolean  "appraisal"
    t.text     "obs"
    t.text     "items"
    t.float    "x",              limit: 24
    t.float    "y",              limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
  end

  add_index "sales", ["property_id"], name: "index_sales_on_property_id", using: :btree
  add_index "sales", ["region_id"], name: "index_sales_on_region_id", using: :btree
  add_index "sales", ["server_id"], name: "index_sales_on_server_id", using: :btree
  add_index "sales", ["status_id"], name: "index_sales_on_status_id", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "server_regions", force: true do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", force: true do |t|
    t.string   "name"
    t.integer  "server_region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "servers", ["server_region_id"], name: "index_servers_on_server_region_id", using: :btree

  create_table "sizes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sold_reportings", force: true do |t|
    t.integer  "sale_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sold_reportings", ["sale_id"], name: "index_sold_reportings_on_sale_id", using: :btree
  add_index "sold_reportings", ["user_id"], name: "index_sold_reportings_on_user_id", using: :btree

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
