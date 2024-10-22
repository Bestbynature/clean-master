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

ActiveRecord::Schema[7.0].define(version: 2024_10_21_070146) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enquiries", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "post_code"
    t.text "message_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_items", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category_name"
    t.string "category_id"
    t.decimal "amount"
    t.integer "quantity"
    t.decimal "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "invoice_number"
    t.integer "status"
    t.date "due_date"
    t.datetime "created_date"
    t.bigint "user_id", null: false
    t.bigint "job_id", null: false
    t.string "client_name"
    t.string "client_address"
    t.decimal "total", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_invoices_on_job_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "location"
    t.string "title"
    t.text "description"
    t.string "job_address"
    t.string "user_client_id"
    t.string "user_client_name"
    t.string "user_assignee_id"
    t.string "user_assignee_name"
    t.integer "job_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.string "email"
    t.string "status"
    t.string "address"
    t.string "country"
    t.string "postal_code"
    t.string "company"
    t.string "profile_photo_path"
    t.string "phone_number"
    t.boolean "is_verified"
    t.string "specialization"
    t.string "qualification"
    t.string "role"
    t.string "certificates_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "invoices", "jobs"
  add_foreign_key "invoices", "users"
end
