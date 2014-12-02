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

ActiveRecord::Schema.define(version: 20141201215121) do

  create_table "orders", force: true do |t|
    t.integer  "amount"
    t.string   "currency",   default: "usd"
    t.string   "name"
    t.string   "email"
    t.string   "notes"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_addresses", force: true do |t|
    t.integer  "order_id"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country",        default: "USA"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
