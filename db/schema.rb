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

ActiveRecord::Schema.define(version: 20160512090600) do

  create_table "attachments", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "portfolio_item_id"
  end

  add_index "attachments", ["portfolio_item_id"], name: "index_attachments_on_portfolio_item_id"

  create_table "companies", force: :cascade do |t|
    t.string   "abn"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "company_industries", force: :cascade do |t|
    t.string   "industry_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "industry_id"
    t.integer  "company_id"
  end

  add_index "company_industries", ["company_id"], name: "index_company_industries_on_company_id"
  add_index "company_industries", ["industry_id"], name: "index_company_industries_on_industry_id"

  create_table "content_ratings", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "content_id"
    t.integer  "job_seeker_id"
  end

  add_index "content_ratings", ["content_id"], name: "index_content_ratings_on_content_id"
  add_index "content_ratings", ["job_seeker_id"], name: "index_content_ratings_on_job_seeker_id"

  create_table "content_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "content_views", force: :cascade do |t|
    t.date     "date_viewed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "content_type_id"
  end

  add_index "contents", ["content_type_id"], name: "index_contents_on_content_type_id"

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interview_reviews", force: :cascade do |t|
    t.string   "company_name"
    t.text     "description"
    t.string   "position"
    t.date     "interview_date"
    t.string   "experience"
    t.boolean  "offer"
    t.integer  "difficulty"
    t.integer  "duration"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "company_id"
    t.integer  "job_seeker_id"
    t.string   "title"
  end

  add_index "interview_reviews", ["company_id"], name: "index_interview_reviews_on_company_id"
  add_index "interview_reviews", ["job_seeker_id"], name: "index_interview_reviews_on_job_seeker_id"

  create_table "job_applications", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "job_seeker_id"
    t.integer  "job_id"
    t.text     "motivation_text"
  end

  add_index "job_applications", ["job_id"], name: "index_job_applications_on_job_id"
  add_index "job_applications", ["job_seeker_id"], name: "index_job_applications_on_job_seeker_id"

  create_table "job_portfolios", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "portfolio_item_id"
  end

  add_index "job_portfolios", ["portfolio_item_id"], name: "index_job_portfolios_on_portfolio_item_id"

  create_table "job_seekers", force: :cascade do |t|
    t.string   "mobile_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "job_seekers", ["user_id"], name: "index_job_seekers_on_user_id"

  create_table "jobs", force: :cascade do |t|
    t.text     "description"
    t.string   "title"
    t.date     "post_date"
    t.date     "closing_date"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.integer  "views"
    t.date     "last_updated"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "sub_industry_id"
    t.string   "work_type"
  end

  add_index "jobs", ["sub_industry_id"], name: "index_jobs_on_sub_industry_id"
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "locations", force: :cascade do |t|
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logins", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.boolean  "verified_account"
    t.date     "last_login"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "logins", ["user_id"], name: "index_logins_on_user_id"

  create_table "members", force: :cascade do |t|
    t.date     "date_joined"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "job_seeker_id"
  end

  add_index "members", ["job_seeker_id"], name: "index_members_on_job_seeker_id"

  create_table "port_folio_item_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolio_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "project_type"
    t.text     "url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "job_seeker_id"
  end

  add_index "portfolio_items", ["job_seeker_id"], name: "index_portfolio_items_on_job_seeker_id"

  create_table "question_answers", force: :cascade do |t|
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reasons", force: :cascade do |t|
    t.text     "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "reported_about"
  end

  add_index "reports", ["user_id"], name: "index_reports_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "description"
    t.boolean  "isAnonymous"
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "company_id"
    t.string   "company_name"
  end

  add_index "reviews", ["company_id"], name: "index_reviews_on_company_id"

  create_table "short_listed_jobs", force: :cascade do |t|
    t.date     "date_added"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "job_seeker_id"
    t.integer  "job_id"
  end

  add_index "short_listed_jobs", ["job_seeker_id"], name: "index_short_listed_jobs_on_job_seeker_id"

  create_table "skill_verifiers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "skill_id"
  end

  add_index "skill_verifiers", ["skill_id"], name: "index_skill_verifiers_on_skill_id"
  add_index "skill_verifiers", ["user_id"], name: "index_skill_verifiers_on_user_id"

  create_table "skills", force: :cascade do |t|
    t.string   "skill_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "industry_id"
  end

  add_index "sub_industries", ["industry_id"], name: "index_sub_industries_on_industry_id"

  create_table "team_members", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.text     "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "title_types", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "login_id"
  end

  add_index "tokens", ["login_id"], name: "index_tokens_on_login_id"

  create_table "upvotes", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "interview_review_id"
    t.integer  "job_seeker_id"
  end

  add_index "upvotes", ["interview_review_id"], name: "index_upvotes_on_interview_review_id"

  create_table "user_locations", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "location_id"
  end

  add_index "user_locations", ["location_id"], name: "index_user_locations_on_location_id"
  add_index "user_locations", ["user_id"], name: "index_user_locations_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "remember_digest"
    t.string   "pic_location"
    t.string   "web_url"
    t.text     "about"
  end

  create_table "views", force: :cascade do |t|
    t.date     "date_viewed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "job_seeker_id"
  end

  add_index "views", ["job_seeker_id"], name: "index_views_on_job_seeker_id"

end
