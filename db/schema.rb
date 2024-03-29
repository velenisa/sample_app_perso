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

ActiveRecord::Schema.define(:version => 20121106140755) do

  create_table "cases", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documents", :force => true do |t|
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "image_low_quality_file_name"
    t.string   "image_low_quality_content_type"
    t.integer  "image_low_quality_file_size"
    t.datetime "image_low_quality_updated_at"
    t.integer  "case_id"
    t.string   "name"
  end

  add_index "documents", ["case_id"], :name => "index_documents_on_case_id"

  create_table "user_profiles", :force => true do |t|
    t.string   "profile_code"
    t.string   "profile_name"
    t.boolean  "profile_active"
    t.boolean  "profile_admin"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
