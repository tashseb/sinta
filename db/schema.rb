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

ActiveRecord::Schema[7.0].define(version: 2022_11_28_013605) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_id"], name: "index_candidates_on_stage_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "feedback"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "candidate_id", null: false
    t.bigint "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.string "status"
    t.index ["candidate_id"], name: "index_interviews_on_candidate_id"
    t.index ["stage_id"], name: "index_interviews_on_stage_id"
    t.index ["user_id"], name: "index_interviews_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "description"
    t.bigint "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_id"], name: "index_questions_on_stage_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "stage_interviewers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_id"], name: "index_stage_interviewers_on_stage_id"
    t.index ["user_id"], name: "index_stage_interviewers_on_user_id"
  end

  create_table "stages", force: :cascade do |t|
    t.string "name"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_stages_on_role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.string "department"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "candidates", "stages"
  add_foreign_key "interviews", "candidates"
  add_foreign_key "interviews", "stages"
  add_foreign_key "interviews", "users"
  add_foreign_key "questions", "stages"
  add_foreign_key "stage_interviewers", "stages"
  add_foreign_key "stage_interviewers", "users"
  add_foreign_key "stages", "roles"
end
