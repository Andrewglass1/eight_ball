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

ActiveRecord::Schema.define(:version => 20130914053031) do

  create_table "questions", :force => true do |t|
    t.text    "description"
    t.string  "title"
    t.integer "response_id"
    t.string  "hit_id"
    t.string  "video_url"
    t.string  "status",      :default => "open"
  end

  create_table "responses", :force => true do |t|
    t.string  "rating"
    t.integer "question_id"
    t.integer "responder_id"
    t.string  "approval_status"
  end

  create_table "turkee_imported_assignments", :force => true do |t|
    t.string   "assignment_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "turkee_task_id"
    t.string   "worker_id"
    t.integer  "result_id"
  end

  add_index "turkee_imported_assignments", ["assignment_id"], :name => "index_turkee_imported_assignments_on_assignment_id", :unique => true
  add_index "turkee_imported_assignments", ["turkee_task_id"], :name => "index_turkee_imported_assignments_on_turkee_task_id"

  create_table "turkee_studies", :force => true do |t|
    t.integer  "turkee_task_id"
    t.text     "feedback"
    t.string   "gold_response"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "turkee_studies", ["turkee_task_id"], :name => "index_turkee_studies_on_turkee_task_id"

  create_table "turkee_tasks", :force => true do |t|
    t.string   "hit_url"
    t.boolean  "sandbox"
    t.string   "task_type"
    t.text     "hit_title"
    t.text     "hit_description"
    t.string   "hit_id"
    t.decimal  "hit_reward",            :precision => 10, :scale => 2
    t.integer  "hit_num_assignments"
    t.integer  "hit_lifetime"
    t.string   "form_url"
    t.integer  "completed_assignments",                                :default => 0
    t.boolean  "complete"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.integer  "hit_duration"
    t.integer  "expired"
  end

end
