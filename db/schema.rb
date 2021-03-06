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

ActiveRecord::Schema.define(version: 20130702185837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commands", force: true do |t|
    t.integer "level_id"
    t.string  "name"
    t.string  "keystroke"
    t.string  "start_mode"
  end

  add_index "commands", ["level_id"], name: "index_commands_on_level_id", using: :btree

  create_table "commands_users", force: true do |t|
    t.integer "user_id"
    t.integer "command_id"
  end

  add_index "commands_users", ["command_id"], name: "index_commands_users_on_command_id", using: :btree
  add_index "commands_users", ["user_id"], name: "index_commands_users_on_user_id", using: :btree

  create_table "lessons", force: true do |t|
    t.string "name"
    t.text   "summary"
    t.string "slug"
    t.text   "directions"
    t.text   "done_message"
  end

  create_table "levels", force: true do |t|
    t.integer "lesson_id"
    t.integer "sequence_number"
    t.string  "name"
    t.string  "slug"
    t.text    "intro"
  end

  add_index "levels", ["lesson_id"], name: "index_levels_on_lesson_id", using: :btree

  create_table "levels_users", force: true do |t|
    t.integer "user_id"
    t.integer "level_id"
    t.string  "timestamps"
  end

  add_index "levels_users", ["level_id"], name: "index_levels_users_on_level_id", using: :btree
  add_index "levels_users", ["user_id"], name: "index_levels_users_on_user_id", using: :btree

  create_table "user_lessons", force: true do |t|
    t.integer "user_id"
    t.integer "lesson_id"
    t.decimal "accuracy"
    t.decimal "average_time"
    t.boolean "completed",    default: false
  end

  add_index "user_lessons", ["lesson_id"], name: "index_user_lessons_on_lesson_id", using: :btree
  add_index "user_lessons", ["user_id"], name: "index_user_lessons_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "reset_password_token"
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "temporary",            default: false
  end

end
