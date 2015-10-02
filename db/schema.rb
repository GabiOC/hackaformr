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

ActiveRecord::Schema.define(version: 20151002154727) do

  create_table "hackathons", force: :cascade do |t|
    t.string   "name"
    t.string   "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participant_skills", force: :cascade do |t|
    t.integer "participant_id"
    t.integer "skills_id"
  end

  add_index "participant_skills", ["participant_id"], name: "index_participant_skills_on_participant_id"
  add_index "participant_skills", ["skills_id"], name: "index_participant_skills_on_skills_id"

  create_table "participants", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "skills"
    t.integer "hackathon_id"
    t.integer "team_id"
  end

  add_index "participants", ["hackathon_id"], name: "index_participants_on_hackathon_id"
  add_index "participants", ["team_id"], name: "index_participants_on_team_id"

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_hackathons", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hackathon_id"
  end

  add_index "user_hackathons", ["hackathon_id"], name: "index_user_hackathons_on_hackathon_id"
  add_index "user_hackathons", ["user_id"], name: "index_user_hackathons_on_user_id"

  create_table "user_skills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "skill_id"
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id"
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id"

  create_table "user_teams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
  end

  add_index "user_teams", ["team_id"], name: "index_user_teams_on_team_id"
  add_index "user_teams", ["user_id"], name: "index_user_teams_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.boolean  "organizer"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
