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

ActiveRecord::Schema.define(version: 20131129185203) do

  create_table "app_versions", force: true do |t|
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id"
  end

  add_index "app_versions", ["app_id"], name: "index_app_versions_on_app_id"

  create_table "apps", force: true do |t|
    t.string   "title"
    t.string   "sku"
    t.string   "apple_identifier"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "country"
    t.string   "digraph"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "units"
    t.decimal  "proceeds"
    t.string   "customer_currency"
    t.integer  "country_id"
    t.string   "currency_of_proceeds"
    t.decimal  "customer_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_version_id"
    t.date     "sales_date"
    t.integer  "upload_file_id"
  end

  add_index "sales", ["app_version_id"], name: "index_sales_on_app_version_id"
  add_index "sales", ["country_id"], name: "index_sales_on_country_id"
  add_index "sales", ["upload_file_id"], name: "index_sales_on_upload_file_id"

  create_table "upload_files", force: true do |t|
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "sales_date"
  end

end
