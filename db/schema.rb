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

ActiveRecord::Schema[7.1].define(version: 2023_10_19_021132) do
  create_table "api_tokens", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.string "secret"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "authie_sessions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "token"
    t.string "browser_id"
    t.integer "user_id"
    t.boolean "active", default: true
    t.text "data"
    t.datetime "expires_at", precision: nil
    t.datetime "login_at", precision: nil
    t.string "login_ip"
    t.datetime "last_activity_at", precision: nil
    t.string "last_activity_ip"
    t.string "last_activity_path"
    t.string "user_agent"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "user_type"
    t.integer "parent_id"
    t.datetime "two_factored_at", precision: nil
    t.string "two_factored_ip"
    t.integer "requests", default: 0
    t.datetime "password_seen_at", precision: nil
    t.string "token_hash"
    t.string "host"
    t.boolean "skip_two_factor", default: false
    t.string "login_ip_country"
    t.string "two_factored_ip_country"
    t.string "last_activity_ip_country"
    t.index ["browser_id"], name: "index_authie_sessions_on_browser_id"
    t.index ["token"], name: "index_authie_sessions_on_token"
    t.index ["token_hash"], name: "index_authie_sessions_on_token_hash"
    t.index ["user_id"], name: "index_authie_sessions_on_user_id"
  end

  create_table "delayed_jobs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at", precision: nil
    t.datetime "locked_at", precision: nil
    t.datetime "failed_at", precision: nil
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "email_templates", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.text "content"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "history_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "item_type"
    t.integer "item_id"
    t.datetime "date", precision: nil
  end

  create_table "issue_service_joins", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "issue_id"
    t.integer "service_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "issue_updates", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "issue_id"
    t.integer "user_id"
    t.integer "service_status_id"
    t.string "state"
    t.text "text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "identifier"
    t.boolean "notify", default: false
  end

  create_table "issues", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "title"
    t.string "state"
    t.integer "service_status_id"
    t.boolean "all_services", default: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.string "identifier"
    t.boolean "notify", default: false
  end

  create_table "login_events", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "user_type"
    t.integer "user_id"
    t.string "username"
    t.string "action"
    t.string "interface"
    t.string "ip"
    t.string "user_agent"
    t.datetime "created_at", precision: nil
    t.index ["created_at"], name: "index_login_events_on_created_at"
    t.index ["interface"], name: "index_login_events_on_interface", length: 10
    t.index ["ip", "id"], name: "index_login_events_on_ip_and_id", length: { ip: 50 }
    t.index ["ip"], name: "index_login_events_on_ip", length: 10
    t.index ["user_id", "id"], name: "index_login_events_on_user_id_and_id"
    t.index ["user_type", "user_id"], name: "index_login_events_on_user_type_and_user_id", length: { user_type: 10 }
  end

  create_table "maintenance_service_joins", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "maintenance_id"
    t.integer "service_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "maintenance_updates", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "maintenance_id"
    t.integer "user_id"
    t.text "text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "identifier"
    t.boolean "notify", default: false
  end

  create_table "maintenances", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.integer "length_in_minutes"
    t.integer "user_id"
    t.integer "service_status_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "closed_at", precision: nil
    t.string "identifier"
    t.boolean "notify", default: false
  end

  create_table "nifty_attachments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "parent_id"
    t.string "parent_type"
    t.string "token"
    t.string "digest"
    t.string "role"
    t.string "file_name"
    t.string "file_type"
    t.binary "data", size: :medium
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "service_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "service_statuses", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "permalink"
    t.string "color"
    t.string "status_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "services", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "permalink"
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "status_id"
    t.text "description"
    t.integer "group_id"
  end

  create_table "sites", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "domain"
    t.string "support_email"
    t.string "website_url"
    t.string "time_zone"
    t.boolean "crawling_permitted", default: false
    t.string "email_from_name"
    t.string "email_from_address"
    t.boolean "allow_subscriptions", default: true
    t.string "http_protocol"
    t.string "privacy_policy_url"
  end

  create_table "subscriber_service_joins", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "subscriber_id"
    t.integer "service_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "subscribers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "email_address"
    t.string "verification_token"
    t.datetime "verified_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "email_address"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

end
