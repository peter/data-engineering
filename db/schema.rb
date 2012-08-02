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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120802203537) do

  create_table "items", :force => true do |t|
    t.text     "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "merchants", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "address",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "purchase_files", :force => true do |t|
    t.string   "name",              :null => false
    t.text     "contents",          :null => false
    t.text     "processing_errors"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "purchasers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "item_price_in_cents",  :null => false
    t.integer  "total_price_in_cents", :null => false
    t.integer  "item_count",           :null => false
    t.integer  "item_id",              :null => false
    t.integer  "purchaser_id",         :null => false
    t.integer  "merchant_id",          :null => false
    t.integer  "purchase_file_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "purchases", ["item_id"], :name => "index_purchases_on_item_id"
  add_index "purchases", ["merchant_id"], :name => "index_purchases_on_merchant_id"
  add_index "purchases", ["purchaser_id"], :name => "index_purchases_on_purchaser_id"

end
