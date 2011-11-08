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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110215035128) do

  create_table "curriculums", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "sort_order"
    t.string   "textbook_file_name"
    t.string   "textbook_content_type"
    t.integer  "textbook_file_size"
    t.datetime "textbook_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "exam_question_id"
    t.text     "answer"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_questions", :force => true do |t|
    t.integer  "curriculum_id"
    t.integer  "number"
    t.text     "title"
    t.text     "question"
    t.text     "answer"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.boolean  "admin_flag",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
