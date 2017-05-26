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

ActiveRecord::Schema.define(version: 20170515215012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.text     "contact_info"
    t.boolean  "job_search_status"
    t.integer  "expected_salary"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "resumes", ["expected_salary"], name: "index_resumes_on_expected_salary", using: :btree

  create_table "resumes_skills", id: false, force: :cascade do |t|
    t.integer "resume_id", null: false
    t.integer "skill_id",  null: false
  end

  add_index "resumes_skills", ["skill_id", "resume_id"], name: "index_resumes_skills_on_skill_id_and_resume_id", unique: true, using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skills", ["title"], name: "index_skills_on_title", unique: true, using: :btree

  create_table "skills_vacancies", id: false, force: :cascade do |t|
    t.integer "vacancy_id", null: false
    t.integer "skill_id",   null: false
  end

  add_index "skills_vacancies", ["skill_id", "vacancy_id"], name: "index_skills_vacancies_on_skill_id_and_vacancy_id", unique: true, using: :btree

  create_table "vacancies", force: :cascade do |t|
    t.string   "title"
    t.datetime "expires_at"
    t.integer  "salary"
    t.text     "contact_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "vacancies", ["expires_at"], name: "index_vacancies_on_expires_at", using: :btree
  add_index "vacancies", ["salary"], name: "index_vacancies_on_salary", using: :btree

  add_foreign_key "resumes_skills", "resumes", on_delete: :cascade
  add_foreign_key "resumes_skills", "skills", on_delete: :cascade
  add_foreign_key "skills_vacancies", "skills", on_delete: :cascade
  add_foreign_key "skills_vacancies", "vacancies", on_delete: :cascade
end
