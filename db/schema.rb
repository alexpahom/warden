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

ActiveRecord::Schema.define(version: 20180814140427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "cases", force: :cascade do |t|
    t.integer "section_id"
    t.string "title"
    t.string "template"
    t.text "precondition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "suite_id"
    t.integer "rank"
    t.index ["section_id"], name: "index_cases_on_section_id"
    t.index ["suite_id"], name: "index_cases_on_suite_id"
  end

  create_table "exp_results", force: :cascade do |t|
    t.integer "case_id"
    t.integer "position"
    t.text "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_exp_results_on_case_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "suite_id"
    t.index ["suite_id"], name: "index_sections_on_suite_id"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "case_id"
    t.integer "position"
    t.text "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_steps_on_case_id"
  end

  create_table "suites", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
