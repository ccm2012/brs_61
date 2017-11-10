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

ActiveRecord::Schema.define(version: 20171108075255) do

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
    t.text "description"
    t.text "content"
    t.float "rating"
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
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
