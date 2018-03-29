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

ActiveRecord::Schema.define(version: 0) do

  create_table "data", force: :cascade do |t|
    t.integer "pid", limit: 8
    t.text "data"
    t.text "field_1"
    t.text "field_2"
    t.text "field_3"
    t.text "field_4"
    t.text "field_5"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "project_id"
    t.boolean "complete", default: false
    t.integer "field_1_on"
    t.integer "field_2_on"
    t.integer "field_3_on"
    t.index ["project_id"], name: "index_data_on_project_id"
  end

  create_table "descriptions", force: :cascade do |t|
    t.integer "flex_good_tf"
    t.text "flex_good"
    t.integer "flex_bad_tf"
    t.text "flex_bad"
    t.integer "work_from_home_tf"
    t.text "work_from_home"
    t.text "benefits_string"
    t.integer "txt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["txt_id"], name: "index_descriptions_on_txt_id"
  end

  create_table "forms", force: :cascade do |t|
    t.text "field_1"
    t.text "field_1_type"
    t.text "field_2"
    t.text "field_2_type"
    t.text "field_3"
    t.text "field_3_type"
    t.text "field_4"
    t.text "field_4_type"
    t.text "field_5"
    t.text "field_5_type"
    t.text "field_6"
    t.text "field_6_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.integer "data_id", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "logo_url"
    t.boolean "is_public", default: false
    t.integer "user_id"
    t.index ["data_id"], name: "index_projects_on_data_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "txts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "tid"
    t.bigint "bgtjobid"
    t.text "jobid"
    t.text "jobtext"
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "first_name"
    t.text "last_name"
    t.text "password_digest"
  end

end
