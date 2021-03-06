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

ActiveRecord::Schema.define(:version => 20130302144510) do

  create_table "institutions", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "phone",      :null => false
    t.string   "email",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "contact"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id",                                 :null => false
    t.integer  "tender_id",                                :null => false
    t.integer  "quantity",                                 :null => false
    t.decimal  "price",      :precision => 8, :scale => 2, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "authorized", :default => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "tenders", :force => true do |t|
    t.string   "name",                                         :null => false
    t.integer  "institution_id",                               :null => false
    t.date     "start",                                        :null => false
    t.date     "stop",                                         :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "file_uid"
    t.decimal  "price",          :precision => 8, :scale => 2, :null => false
  end

  create_table "url_connectors", :force => true do |t|
    t.string   "temp_url",                       :null => false
    t.integer  "user_id",                        :null => false
    t.boolean  "active",       :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "line_item_id",                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "phone",                                  :null => false
    t.string   "address",                                :null => false
    t.string   "city",                                   :null => false
    t.string   "cap",                                    :null => false
    t.string   "partitaiva",                             :null => false
    t.string   "ragionesociale",                         :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["partitaiva"], :name => "index_users_on_partitaiva", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "volantinos", :force => true do |t|
    t.string   "name"
    t.date     "start"
    t.date     "stop"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
