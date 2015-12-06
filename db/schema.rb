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

ActiveRecord::Schema.define(version: 20151206161356) do

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "others", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "experience"
    t.text     "kind"
    t.integer  "user_id"
  end

  create_table "paths", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "experience"
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "physicians", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "experience"
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rads", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "experience"
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rheumatologists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "experience"
    t.string   "kind"
  end

  create_table "users", force: :cascade do |t|
    t.string   "specialist"
    t.string   "institute_type"
    t.boolean  "radiologist"
    t.boolean  "pathologist"
    t.string   "schedule",        default: "Weekly"
    t.integer  "cases"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "member_id"
    t.string   "country"
    t.integer  "ipf"
    t.integer  "ipfpatients"
    t.integer  "sarcoidpatients"
    t.integer  "iippatients"
    t.integer  "ctdpatients"
    t.integer  "unclasspatients"
    t.integer  "nonild"
    t.integer  "hppatients"
    t.string   "iso"
    t.string   "institute"
    t.string   "practice"
    t.integer  "biopsy"
    t.string   "cryobiopsy"
    t.string   "kind"
    t.integer  "experience"
    t.integer  "other"
    t.text     "comment"
  end

end
