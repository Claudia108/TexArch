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

ActiveRecord::Schema.define(version: 20160609041525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artifacts", force: :cascade do |t|
    t.integer  "ui"
    t.string   "point_type"
    t.integer  "max_thickness"
    t.integer  "max_length"
    t.integer  "max_width"
    t.integer  "basal_edge_width"
    t.integer  "site_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "artifacts", ["site_id"], name: "index_artifacts_on_site_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.string   "artifact_file_name"
    t.string   "artifact_content_type"
    t.integer  "artifact_file_size"
    t.datetime "artifact_updated_at"
    t.integer  "artifact_id"
  end

  add_index "images", ["artifact_id"], name: "index_images_on_artifact_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "longitude"
    t.string   "latitude"
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "site_type",  default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "role",       default: 0
  end

  add_foreign_key "artifacts", "sites"
  add_foreign_key "images", "artifacts"
end
