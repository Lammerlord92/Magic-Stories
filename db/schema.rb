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

ActiveRecord::Schema.define(version: 20160420103345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actor_user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "usergroup_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "additions", force: :cascade do |t|
    t.datetime "purchase_date"
    t.float    "base_price"
    t.integer  "discount_id"
    t.integer  "profile_id"
    t.integer  "story_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "additions", ["discount_id"], name: "index_additions_on_discount_id", using: :btree
  add_index "additions", ["profile_id"], name: "index_additions_on_profile_id", using: :btree
  add_index "additions", ["story_id"], name: "index_additions_on_story_id", using: :btree

  create_table "administrators", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "icon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "story_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.date     "date"
    t.integer  "rating"
    t.string   "author"
    t.integer  "profile_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["profile_id"], name: "index_comments_on_profile_id", using: :btree
  add_index "comments", ["story_id"], name: "index_comments_on_story_id", using: :btree

  create_table "discount_user_groups", force: :cascade do |t|
    t.integer  "user_group_id"
    t.integer  "discount_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.string   "description"
    t.float    "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "used"
  end

  create_table "donations", force: :cascade do |t|
    t.float    "amount"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "free_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "request_friendship_id"
  end

  add_index "friendships", ["request_friendship_id"], name: "index_friendships_on_request_friendship_id", using: :btree

  create_table "has_categories", force: :cascade do |t|
    t.integer  "story_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "has_categories", ["category_id"], name: "index_has_categories_on_category_id", using: :btree
  add_index "has_categories", ["story_id"], name: "index_has_categories_on_story_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes", using: :btree

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "membership_cards", force: :cascade do |t|
    t.string   "code"
    t.datetime "expiration"
    t.float    "premiumMonths"
    t.text     "message"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "usage"
  end

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "feed_id"
    t.string   "feed_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "checked",    default: false
    t.integer  "source_id"
    t.integer  "outcome_id"
  end

  create_table "options", force: :cascade do |t|
    t.string   "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
    t.integer  "child_id"
  end

  create_table "payments", force: :cascade do |t|
    t.float    "amount",     default: 0.0
    t.string   "token"
    t.string   "identifier"
    t.string   "payer_id"
    t.boolean  "recurring",  default: false
    t.boolean  "digital",    default: false
    t.boolean  "popup",      default: false
    t.boolean  "completed",  default: false
    t.boolean  "canceled",   default: false
    t.integer  "good_id"
    t.string   "good_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "premium_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expiration"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "description"
    t.string   "signature"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "profile_status"
    t.integer  "followees_count", default: 0
    t.integer  "followers_count", default: 0
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "body"
    t.string   "status"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_friendships", force: :cascade do |t|
    t.integer  "sender_id",    null: false
    t.integer  "recipient_id", null: false
    t.text     "message"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "language"
    t.float    "price"
    t.date     "release_date"
    t.boolean  "published"
    t.integer  "num_purchased"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "profile_id"
    t.text     "cover"
  end

  add_index "stories", ["profile_id"], name: "index_stories_on_profile_id", using: :btree

  create_table "user_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "discount_user_group_id"
    t.integer  "actor_user_group_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username",                            null: false
    t.string   "name",                                null: false
    t.string   "surname1",                            null: false
    t.string   "surname2",                            null: false
    t.string   "phone"
    t.date     "birthday",                            null: false
    t.string   "sku",                                 null: false
    t.integer  "role_id"
    t.string   "role_type"
    t.datetime "banned_until"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "additions", "discounts"
  add_foreign_key "additions", "profiles"
  add_foreign_key "additions", "stories"
  add_foreign_key "comments", "profiles"
  add_foreign_key "comments", "stories"
  add_foreign_key "friendships", "request_friendships"
  add_foreign_key "has_categories", "categories"
  add_foreign_key "has_categories", "stories"
  add_foreign_key "identities", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "stories", "profiles"
end
