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

ActiveRecord::Schema.define(:version => 20130508134306) do

  create_table "bookings", :force => true do |t|
    t.integer  "reseller_id"
    t.integer  "customer_id"
    t.string   "contact_name"
    t.string   "contact_email"
    t.datetime "training_date"
    t.string   "training_type"
    t.decimal  "length"
    t.integer  "quote_id"
    t.string   "purchase_order"
    t.boolean  "training_confirmed"
    t.boolean  "invoice_sent"
    t.boolean  "training_approved"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "audience"
    t.text     "description"
    t.text     "learning_outcomes"
    t.text     "equipment"
    t.decimal  "enduser_cost"
    t.decimal  "contract_cost"
    t.decimal  "length"
    t.string   "location"
    t.string   "category"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "thumbnail"
    t.string   "retinathumbnail"
    t.date     "release_date"
    t.boolean  "status",            :default => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hostings", :force => true do |t|
    t.string   "domain_name",         :null => false
    t.string   "hosting_package",     :null => false
    t.boolean  "domain_registration"
    t.string   "email",               :null => false
    t.integer  "customer_id",         :null => false
    t.string   "contact_name"
    t.string   "contact_email",       :null => false
    t.text     "additional_domains"
    t.text     "notes"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "resellers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trainings", :force => true do |t|
    t.integer  "reseller_id"
    t.integer  "customer_id"
    t.string   "contact_name"
    t.string   "contact_email"
    t.datetime "training_date"
    t.string   "training_type"
    t.decimal  "length"
    t.integer  "quote_id"
    t.string   "purchase_order"
    t.boolean  "training_confirmed"
    t.boolean  "invoice_sent"
    t.boolean  "training_approved"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "details"
    t.string   "thumbnail"
    t.string   "retinathumbnail"
    t.string   "video_file"
    t.string   "app_url"
    t.string   "app_thumbnail"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
