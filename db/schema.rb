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

ActiveRecord::Schema[7.0].define(version: 2023_08_04_221356) do
  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.string "topic"
    t.text "body"
    t.string "imgurl"
    t.integer "views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_blog_posts_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "blog_post_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_post_id"], name: "index_comments_on_blog_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows_users_topics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "save_posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "blog_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_post_id"], name: "index_save_posts_on_blog_post_id"
    t.index ["user_id"], name: "index_save_posts_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "tierfree"
    t.boolean "tier3d"
    t.boolean "tier5d"
    t.boolean "tier10d"
    t.integer "allowedViews"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "topicname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_like_blog_posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "blog_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_post_id"], name: "index_user_like_blog_posts_on_blog_post_id"
    t.index ["user_id"], name: "index_user_like_blog_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
    t.string "bio"
    t.string "profilepicture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blog_posts", "users"
  add_foreign_key "comments", "blog_posts"
  add_foreign_key "comments", "users"
  add_foreign_key "save_posts", "blog_posts"
  add_foreign_key "save_posts", "users"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "user_like_blog_posts", "blog_posts"
  add_foreign_key "user_like_blog_posts", "users"
end
