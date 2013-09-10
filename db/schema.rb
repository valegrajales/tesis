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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130507183044) do

  create_table "meeting_annotations", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "attachment_url"
    t.integer  "meeting_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "meeting_annotations", ["meeting_id"], :name => "index_meeting_annotations_on_meeting_id"

  create_table "meetings", :force => true do |t|
    t.datetime "meeting_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "thesis_id"
  end

  add_index "meetings", ["thesis_id"], :name => "index_meetings_on_thesis_id"

  create_table "products", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "thesis_id"
  end

  add_index "products", ["thesis_id"], :name => "index_products_on_thesis_id"

  create_table "source_annotations", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "source_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "source_annotations", ["source_id"], :name => "index_source_annotations_on_source_id"

  create_table "sources", :force => true do |t|
    t.string   "description"
    t.integer  "source_type_id"
    t.string   "attachment_url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "title"
    t.string   "reference"
    t.integer  "thesis_id"
  end

  add_index "sources", ["thesis_id"], :name => "index_sources_on_thesis_id"

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "major"
    t.string   "student_code"
    t.string   "username"
    t.integer  "age"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "thesis_id"
  end

  add_index "students", ["name"], :name => "index_students_on_name"
  add_index "students", ["thesis_id"], :name => "index_students_on_thesis_id"
  add_index "students", ["username"], :name => "index_students_on_username", :unique => true

  create_table "theses", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
    t.string   "teacher"
  end

end
