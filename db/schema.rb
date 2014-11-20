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

ActiveRecord::Schema.define(version: 20141119190300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "presentations", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "presentation_id"
    t.string   "access_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slides", force: true do |t|
    t.integer  "presentation_id"
    t.integer  "slide_number"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slide_type"
  end

  create_table "survey_feedbacks", force: true do |t|
    t.integer  "survey_option_id"
    t.integer  "session_id"
    t.integer  "total_votes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_options", force: true do |t|
    t.integer  "slide_id"
    t.integer  "option_number"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
