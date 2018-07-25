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

ActiveRecord::Schema.define(version: 2018_07_25_142748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "salutation", limit: 20
    t.string "title", limit: 20
    t.string "street_number", limit: 20
    t.string "zip", limit: 20
    t.string "type", limit: 20
    t.string "company_ident", limit: 20
    t.string "firstname", limit: 80
    t.string "name", limit: 80
    t.string "street", limit: 80
    t.string "city", limit: 80
    t.string "country", limit: 80
    t.string "email", limit: 80
    t.string "company_name", limit: 80
    t.text "phone"
    t.text "fax"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["company_ident"], name: "addresses_company_ident_index", unique: true
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "articles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "quantity", default: 1, null: false
    t.decimal "price", precision: 11, scale: 2, null: false
    t.decimal "discount", precision: 11, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "invoice_id", null: false
    t.boolean "vat_included", default: true, null: false
    t.index ["invoice_id"], name: "index_articles_on_invoice_id"
  end

  create_table "audits", id: :serial, force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type", limit: 255
    t.integer "associated_id"
    t.string "associated_type", limit: 255
    t.integer "user_id"
    t.string "user_type", limit: 255
    t.string "username", limit: 255
    t.string "action", limit: 255
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment", limit: 255
    t.string "remote_address", limit: 255
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["user_id", "user_type"], name: "user_index"
    t.index ["user_id"], name: "index_audits_on_user_id"
  end

  create_table "bike_parts", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "quantity", default: 1, null: false
    t.decimal "price", precision: 11, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bike_id", null: false
    t.index ["bike_id"], name: "index_bike_parts_on_bike_id"
  end

  create_table "bikes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50
    t.text "remark"
    t.string "state", limit: 255, null: false
    t.string "manufacturer", limit: 50
    t.decimal "retail_price", precision: 11, scale: 2, null: false
    t.string "frame_number", limit: 50
    t.string "frame_number_place", limit: 50
    t.string "frame_size", limit: 10
    t.string "frame_size_unit", limit: 10
    t.string "frame_color", limit: 50
    t.string "shipping_number", limit: 50
    t.datetime "state_updated_at"
    t.string "configuration", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_id", null: false
    t.integer "store_id", null: false
    t.string "frame_style", limit: 50
    t.boolean "second_hand", default: false, null: false
    t.date "delivery_date"
    t.date "ordered_on"
    t.date "preordered_on"
    t.date "delivered_on"
    t.string "model_year", limit: 50
    t.decimal "purchase_price", precision: 11, scale: 2
    t.index ["address_id"], name: "index_bikes_on_address_id"
    t.index ["store_id"], name: "index_bikes_on_store_id"
  end

  create_table "bikes_labels", id: false, force: :cascade do |t|
    t.integer "bike_id"
    t.integer "label_id"
    t.index ["bike_id", "label_id"], name: "index_bikes_labels_on_bike_id_and_label_id", unique: true
    t.index ["bike_id"], name: "index_bikes_labels_on_bike_id"
    t.index ["label_id"], name: "index_bikes_labels_on_label_id"
  end

  create_table "cash_desks", id: :serial, force: :cascade do |t|
    t.date "date", null: false
    t.decimal "start_amount", precision: 11, scale: 2, null: false
    t.decimal "end_amount", precision: 11, scale: 2, null: false
    t.decimal "cash_receipts", precision: 11, scale: 2, null: false
    t.decimal "to_bank", precision: 11, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_id", null: false
    t.index ["store_id"], name: "index_cash_desks_on_store_id"
  end

  create_table "complaint_parcels", id: :serial, force: :cascade do |t|
    t.text "text"
    t.string "state", limit: 50, null: false
    t.datetime "state_updated_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wholesaler_id", null: false
    t.integer "store_id", null: false
    t.string "pdf_path", limit: 255
    t.text "text2"
    t.boolean "pickup_request", default: false
    t.boolean "returned_goods", default: false
    t.index ["store_id"], name: "index_complaint_parcels_on_store_id"
    t.index ["wholesaler_id"], name: "index_complaint_parcels_on_wholesaler_id"
  end

  create_table "complaints", id: :serial, force: :cascade do |t|
    t.string "article", limit: 150, null: false
    t.integer "address_id", null: false
    t.integer "store_id", null: false
    t.datetime "state_updated_at"
    t.text "internal_remark"
    t.string "state", limit: 50, null: false
    t.text "reason", null: false
    t.integer "wholesaler_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.string "age_unit", limit: 255
    t.decimal "price", precision: 11, scale: 2
    t.string "customer_request", limit: 50
    t.string "customer_result", limit: 40
    t.integer "complaint_parcel_id"
    t.integer "quantity", default: 1, null: false
    t.text "wholesaler_remark"
    t.boolean "unused", default: false
    t.string "wholesaler_result", limit: 50
    t.string "wholesaler_request", limit: 50
    t.index ["address_id"], name: "index_complaints_on_address_id"
    t.index ["complaint_parcel_id"], name: "index_complaints_on_complaint_parcel_id"
    t.index ["store_id"], name: "index_complaints_on_store_id"
    t.index ["wholesaler_id"], name: "index_complaints_on_wholesaler_id"
  end

  create_table "credits", id: :serial, force: :cascade do |t|
    t.integer "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount", precision: 11, scale: 2
    t.string "text", limit: 255
    t.integer "store_id"
    t.integer "complaint_id"
    t.index ["address_id"], name: "index_credits_on_address_id"
    t.index ["complaint_id"], name: "index_credits_on_complaint_id"
    t.index ["store_id"], name: "index_credits_on_store_id"
  end

  create_table "expenses", id: :serial, force: :cascade do |t|
    t.date "date", null: false
    t.decimal "amount", precision: 11, scale: 2, null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_id", null: false
    t.string "payment_type", limit: 20, default: "cash", null: false
    t.integer "address_id"
    t.boolean "credit_paid_out", default: false
    t.index ["address_id"], name: "index_expenses_on_address_id"
    t.index ["store_id"], name: "index_expenses_on_store_id"
  end

  create_table "invoice_numbers", id: :serial, force: :cascade do |t|
    t.integer "number", null: false
    t.integer "store_id", null: false
    t.integer "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_invoice_numbers_on_store_id"
  end

  create_table "invoices", id: :serial, force: :cascade do |t|
    t.date "date"
    t.date "due_date"
    t.text "remark"
    t.string "state", limit: 255, null: false
    t.string "number", limit: 255
    t.string "payment_type", limit: 255
    t.boolean "vat_free", default: false
    t.text "text"
    t.datetime "state_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_id", null: false
    t.integer "store_id"
    t.string "pdf_path", limit: 255
    t.decimal "used_credit", precision: 11, scale: 2, default: "0.0"
    t.decimal "end_amount", precision: 11, scale: 2
    t.index ["address_id"], name: "index_invoices_on_address_id"
    t.index ["store_id"], name: "index_invoices_on_store_id"
  end

  create_table "labels", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "color", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "linked_articles", id: :serial, force: :cascade do |t|
    t.string "linked_article_type", limit: 255
    t.integer "linked_article_id"
    t.integer "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount", precision: 11, scale: 2, default: "0.0", null: false
    t.integer "quantity"
    t.boolean "vat_included", default: true, null: false
    t.index ["invoice_id"], name: "index_linked_articles_on_invoice_id"
    t.index ["linked_article_id", "linked_article_type"], name: "index_linked_articles_on_article_id_and_type"
  end

  create_table "order_articles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 150
    t.integer "quantity", default: 1, null: false
    t.decimal "price", precision: 11, scale: 2, null: false
    t.string "state", limit: 30
    t.integer "from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id", null: false
    t.index ["order_id"], name: "index_order_articles_on_order_id"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.datetime "state_updated_at"
    t.string "state", limit: 30, null: false
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_id", null: false
    t.integer "address_id", null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["store_id"], name: "index_orders_on_store_id"
  end

  create_table "payments", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 11, scale: 2, null: false
    t.string "state", limit: 255, null: false
    t.date "payment_date"
    t.string "payment_type", limit: 255, null: false
    t.boolean "advance", default: false, null: false
    t.string "link_type", limit: 255, null: false
    t.integer "link_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_id", null: false
    t.integer "store_id", null: false
    t.boolean "postentry", default: false
    t.index ["address_id"], name: "index_payments_on_address_id"
    t.index ["link_id", "link_type"], name: "index_payments_on_link_id_and_link_type"
    t.index ["store_id"], name: "index_payments_on_store_id"
  end

  create_table "product_categories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.decimal "retail_price", precision: 11, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_category_id", null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "key", limit: 255, null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category", limit: 255
    t.string "data_type", limit: 255
    t.integer "category_id"
    t.boolean "obligatory", default: false
  end

  create_table "staffs_team_meetings", id: false, force: :cascade do |t|
    t.integer "staff_id"
    t.integer "team_meeting_id"
    t.index ["staff_id"], name: "index_staffs_team_meetings_on_staff_id"
    t.index ["team_meeting_id", "staff_id"], name: "index_staffs_team_meetings_on_team_meeting_id_and_staff_id", unique: true
    t.index ["team_meeting_id"], name: "index_staffs_team_meetings_on_team_meeting_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_topics", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "topic_id"
    t.index ["tag_id", "topic_id"], name: "index_tags_topics_on_tag_id_and_topic_id", unique: true
    t.index ["tag_id"], name: "index_tags_topics_on_tag_id"
    t.index ["topic_id"], name: "index_tags_topics_on_topic_id"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.text "description", null: false
    t.integer "bike_id", null: false
    t.string "blocks_event", limit: 255, null: false
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_tasks_on_bike_id"
  end

  create_table "team_meetings", id: :serial, force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "minute_taker_id"
    t.index ["minute_taker_id"], name: "index_team_meetings_on_minute_taker_id"
  end

  create_table "topics", id: :serial, force: :cascade do |t|
    t.string "subject", limit: 255
    t.text "minutes"
    t.integer "team_meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "submitter_id"
    t.text "details"
    t.index ["submitter_id"], name: "index_topics_on_submitter_id"
    t.index ["team_meeting_id"], name: "index_topics_on_team_meeting_id"
  end

  create_table "user_roles", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "username", limit: 50, null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token", limit: 255
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", limit: 80, default: "", null: false
    t.boolean "admin", default: false, null: false
    t.boolean "accountant", default: false, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "wholesalers", id: :serial, force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", limit: 50, null: false
    t.string "customer_id", limit: 30
    t.string "street", limit: 50, null: false
    t.string "street_number", limit: 10, null: false
    t.string "zip", limit: 20, null: false
    t.string "city", limit: 30, null: false
    t.text "phone"
    t.text "fax"
    t.string "email", limit: 50
    t.string "website", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country", limit: 255, default: "DE", null: false
    t.text "remark"
    t.string "ident", limit: 255
    t.text "conditions"
  end

  add_foreign_key "addresses", "users", name: "addresses_user_id_fkey"
  add_foreign_key "articles", "invoices", name: "articles_invoice_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "audits", "addresses", column: "user_id", name: "audits_user_id_fkey"
  add_foreign_key "bike_parts", "bikes", name: "bike_parts_bike_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "bikes", "addresses", column: "store_id", name: "bikes_store_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "bikes", "addresses", name: "bikes_address_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "bikes_labels", "bikes", name: "bikes_labels_bike_id_fkey"
  add_foreign_key "bikes_labels", "labels", name: "bikes_labels_label_id_fkey"
  add_foreign_key "cash_desks", "addresses", column: "store_id", name: "cash_desks_store_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "complaint_parcels", "addresses", column: "store_id", name: "complaint_parcels_store_id_fkey"
  add_foreign_key "complaint_parcels", "wholesalers", name: "complaint_parcels_wholesaler_id_fkey"
  add_foreign_key "complaints", "addresses", column: "store_id", name: "complaints_store_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "complaints", "addresses", name: "complaints_address_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "complaints", "complaint_parcels", name: "complaints_complaint_parcel_id_fkey"
  add_foreign_key "complaints", "wholesalers", name: "complaints_wholesaler_id_fkey"
  add_foreign_key "credits", "addresses", column: "store_id", name: "credits_store_id_fkey"
  add_foreign_key "credits", "addresses", name: "credits_address_id_fkey"
  add_foreign_key "credits", "complaints", name: "credits_complaint_id_fkey"
  add_foreign_key "expenses", "addresses", column: "store_id", name: "expenses_store_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "expenses", "addresses", name: "expenses_address_id_fkey"
  add_foreign_key "invoice_numbers", "addresses", column: "store_id", name: "invoice_numbers_store_id_fkey"
  add_foreign_key "invoices", "addresses", column: "store_id", name: "invoices_store_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "invoices", "addresses", name: "invoices_address_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "linked_articles", "invoices", name: "linked_articles_invoice_id_fkey"
  add_foreign_key "order_articles", "orders", name: "order_articles_order_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "orders", "addresses", column: "store_id", name: "orders_store_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "orders", "addresses", name: "orders_address_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "payments", "addresses", column: "store_id", name: "payments_store_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "payments", "addresses", name: "payments_address_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "products", "product_categories", name: "products_product_category_id_fkey"
  add_foreign_key "staffs_team_meetings", "addresses", column: "staff_id", name: "staffs_team_meetings_staff_id_fkey"
  add_foreign_key "staffs_team_meetings", "team_meetings", name: "staffs_team_meetings_team_meeting_id_fkey"
  add_foreign_key "tags_topics", "tags", name: "tags_topics_tag_id_fkey"
  add_foreign_key "tags_topics", "topics", name: "tags_topics_topic_id_fkey"
  add_foreign_key "tasks", "bikes", name: "tasks_bike_id_fkey"
  add_foreign_key "team_meetings", "addresses", column: "minute_taker_id", name: "team_meetings_minute_taker_id_fkey"
  add_foreign_key "topics", "addresses", column: "submitter_id", name: "topics_submitter_id_fkey"
  add_foreign_key "topics", "team_meetings", name: "topics_team_meeting_id_fkey"
  add_foreign_key "user_roles", "roles", name: "user_roles_role_id_fkey"
  add_foreign_key "user_roles", "users", name: "user_roles_user_id_fkey"
end
