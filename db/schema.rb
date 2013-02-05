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

ActiveRecord::Schema.define(:version => 20130205010842) do

  create_table "houses", :force => true do |t|
    t.string   "address"
    t.string   "suburb"
    t.string   "postcode"
    t.integer  "cost"
    t.integer  "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "investor_id"
  end

  create_table "investors", :force => true do |t|
    t.string   "name"
    t.integer  "total_cost"
    t.integer  "total_value"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "price_cents",    :default => 0,     :null => false
    t.string   "price_currency", :default => "USD", :null => false
  end

end
