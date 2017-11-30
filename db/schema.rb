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

ActiveRecord::Schema.define(version: 20171127090522) do

  create_table "activities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "action"
    t.string "objectable_type"
    t.integer "objectable_id"
    t.string "targetable_type"
    t.integer "targetable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["objectable_type", "objectable_id"], name: "index_activities_on_objectable_type_and_objectable_id"
    t.index ["targetable_type", "targetable_id"], name: "index_activities_on_targetable_type_and_targetable_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "bill_details", force: :cascade do |t|
    t.integer "bill_id"
    t.integer "book_id"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_details_on_bill_id"
    t.index ["book_id"], name: "index_bill_details_on_book_id"
  end

  create_table "bills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "category_id"
    t.string "title"
    t.string "author"
    t.datetime "date_published"
    t.text "summary"
    t.text "description", default: ""
    t.text "content"
    t.float "rating", default: 0.0
    t.integer "price"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_id"
    t.text "content"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "reading_histories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.integer "mark_as"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reading_histories_on_book_id"
    t.index ["user_id"], name: "index_reading_histories_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "action"
    t.string "targetable_type"
    t.integer "targetable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["targetable_type", "targetable_id"], name: "index_relationships_on_targetable_type_and_targetable_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.integer "rate"
    t.text "content"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
