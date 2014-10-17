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

ActiveRecord::Schema.define(version: 20141017065229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.boolean  "correct"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "lti_launches", force: true do |t|
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "canvas_id"
    t.text     "name"
    t.text     "text"
    t.integer  "points_possible"
    t.integer  "difficulty"
    t.integer  "asked_count"
    t.integer  "correct_count"
    t.text     "question_type"
    t.integer  "test_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_instances", force: true do |t|
    t.integer  "attempt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "test_id"
    t.integer  "ability"
    t.integer  "questions_asked",   array: true
    t.integer  "questions_correct", array: true
  end

  add_index "test_instances", ["test_id"], name: "index_test_instances_on_test_id", using: :btree
  add_index "test_instances", ["user_id"], name: "index_test_instances_on_user_id", using: :btree

  create_table "tests", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "attempt"
    t.integer  "canvas_id"
    t.integer  "canvas_course_id"
    t.integer  "question_min"
    t.integer  "question_max"
    t.float    "mastery_threshold"
    t.float    "failure_threshold"
    t.integer  "test_instances_id"
  end

  add_index "tests", ["test_instances_id"], name: "index_tests_on_test_instances_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "full_name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "ability"
    t.integer  "canvas_user_id"
    t.integer  "canvas_course_id"
  end

end
