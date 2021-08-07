# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_28_194439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "lecture_id", null: false
    t.index ["lecture_id"], name: "index_appointments_on_lecture_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "lecture_groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "img_thumb"
    t.string "shortname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lecture_types", force: :cascade do |t|
    t.bigint "lecture_id", null: false
    t.bigint "lecture_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lecture_group_id"], name: "index_lecture_types_on_lecture_group_id"
    t.index ["lecture_id"], name: "index_lecture_types_on_lecture_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img_thumb"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.boolean "admin", default: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "lectures"
  add_foreign_key "appointments", "users"
  add_foreign_key "lecture_types", "lecture_groups"
  add_foreign_key "lecture_types", "lectures"
end
