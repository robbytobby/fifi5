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

ActiveRecord::Schema.define(version: 2018_07_25_112824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
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
    t.index ["user_id"], name: "index_addresses_on_user_id", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "name", null: false
    t.integer "quantity", default: 1, null: false
    t.decimal "price", precision: 11, scale: 2, null: false
    t.decimal "discount", precision: 11, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "invoice_id", null: false
    t.boolean "vat_included", default: true, null: false
    t.index ["invoice_id"], name: "index_articles_on_invoice_id", unique: true
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "index_audits_on_associated_id_and_associated_type", unique: true
    t.index ["auditable_id", "auditable_type"], name: "index_audits_on_auditable_id_and_auditable_type", unique: true
    t.index ["user_id", "user_type"], name: "index_audits_on_user_id_and_user_type", unique: true
  end

  create_table "bike_parts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "quantity", default: 1, null: false
    t.decimal "price", precision: 11, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bike_id", null: false
    t.index ["bike_id"], name: "index_bike_parts_on_bike_id", unique: true
  end

  create_table "bikes", force: :cascade do |t|
    t.string "name", limit: 50
    t.text "remark"
    t.string "state", null: false
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
    t.index ["address_id"], name: "index_bikes_on_address_id", unique: true
  end

  create_table "bikes_labels", id: false, force: :cascade do |t|
    t.integer "bike_id"
    t.integer "label_id"
    t.index ["bike_id"], name: "index_bikes_labels_on_bike_id", unique: true
    t.index ["label_id"], name: "index_bikes_labels_on_label_id", unique: true
  end

  create_table "cash_desks", force: :cascade do |t|
    t.date "date", null: false
    t.decimal "start_amount", precision: 11, scale: 2, null: false
    t.decimal "end_amount", precision: 11, scale: 2, null: false
    t.decimal "cash_receipts", precision: 11, scale: 2, null: false
    t.decimal "to_bank", precision: 11, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_id", null: false
  end

  create_table "complaint_parcels", force: :cascade do |t|
    t.text "text"
    t.string "state", limit: 50, null: false
    t.datetime "state_updated_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wholesaler_id", null: false
    t.integer "store_id", null: false
    t.string "pdf_path"
    t.text "text2"
    t.boolean "pickup_request", default: false
    t.boolean "returned_goods", default: false
    t.index ["wholesaler_id"], name: "index_complaint_parcels_on_wholesaler_id", unique: true
  end

  create_table "complaints", force: :cascade do |t|
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
    t.string "age_unit"
    t.decimal "price", precision: 11, scale: 2
    t.string "customer_request", limit: 50
    t.string "customer_result", limit: 40
    t.integer "complaint_parcel_id"
    t.integer "quantity", default: 1, null: false
    t.text "wholesaler_remark"
    t.boolean "unused", default: false
    t.string "wholesaler_result", limit: 50
    t.string "wholesaler_request", limit: 50
    t.index ["address_id"], name: "index_complaints_on_address_id", unique: true
    t.index ["complaint_parcel_id"], name: "index_complaints_on_complaint_parcel_id", unique: true
    t.index ["wholesaler_id"], name: "index_complaints_on_wholesaler_id", unique: true
  end

  create_table "credits", force: :cascade do |t|
    t.integer "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount", precision: 11, scale: 2
    t.string "text"
    t.integer "store_id"
    t.integer "complaint_id"
    t.index ["address_id"], name: "index_credits_on_address_id", unique: true
    t.index ["complaint_id"], name: "index_credits_on_complaint_id", unique: true
  end

  create_table "expenses", force: :cascade do |t|
    t.date "date", null: false
    t.decimal "amount", precision: 11, scale: 2, null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_id", null: false
    t.string "payment_type", limit: 20, default: "cash", null: false
    t.integer "address_id"
    t.boolean "credit_paid_out", default: false
    t.index ["address_id"], name: "index_expenses_on_address_id", unique: true
  end

  create_table "invoice_numbers", force: :cascade do |t|
    t.integer "number", null: false
    t.integer "store_id", null: false
    t.integer "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.date "date"
    t.date "due_date"
    t.text "remark"
    t.string "state", null: false
    t.string "number"
    t.string "payment_type"
    t.boolean "vat_free", default: false
    t.text "text"
    t.datetime "state_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_id", null: false
    t.integer "store_id"
    t.string "pdf_path"
    t.decimal "used_credit", precision: 11, scale: 2, default: "0.0"
    t.decimal "end_amount", precision: 11, scale: 2
    t.index ["address_id"], name: "index_invoices_on_address_id", unique: true
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "linked_articles", force: :cascade do |t|
    t.string "linked_article_type"
    t.integer "linked_article_id"
    t.integer "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount", precision: 11, scale: 2, default: "0.0", null: false
    t.integer "quantity"
    t.boolean "vat_included", default: true, null: false
    t.index ["invoice_id"], name: "index_linked_articles_on_invoice_id", unique: true
    t.index ["linked_article_id", "linked_article_type"], name: "index_linked_articles_on_article_id_and_type", unique: true
  end

  create_table "order_articles", force: :cascade do |t|
    t.string "name", limit: 150
    t.integer "quantity", default: 1, null: false
    t.decimal "price", precision: 11, scale: 2, null: false
    t.string "state", limit: 30
    t.integer "from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id", null: false
    t.index ["order_id"], name: "index_order_articles_on_order_id", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "state_updated_at"
    t.string "state", limit: 30, null: false
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_id", null: false
    t.integer "address_id", null: false
    t.index ["address_id"], name: "index_orders_on_address_id", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", precision: 11, scale: 2, null: false
    t.string "state", null: false
    t.date "payment_date"
    t.string "payment_type", null: false
    t.boolean "advance", default: false, null: false
    t.string "link_type", null: false
    t.integer "link_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_id", null: false
    t.integer "store_id", null: false
    t.boolean "postentry", default: false
    t.index ["address_id"], name: "index_payments_on_address_id", unique: true
    t.index ["link_id", "link_type"], name: "index_payments_on_link_id_and_link_type", unique: true
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.decimal "retail_price", precision: 11, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_category_id", null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "key", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "data_type"
    t.integer "category_id"
    t.boolean "obligatory", default: false
  end

  create_table "staffs_team_meetings", id: false, force: :cascade do |t|
    t.integer "staff_id"
    t.integer "team_meeting_id"
    t.index ["team_meeting_id"], name: "index_staffs_team_meetings_on_team_meeting_id", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_topics", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "topic_id"
    t.index ["tag_id"], name: "index_tags_topics_on_tag_id", unique: true
    t.index ["topic_id"], name: "index_tags_topics_on_topic_id", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description", null: false
    t.integer "bike_id", null: false
    t.string "blocks_event", null: false
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_tasks_on_bike_id", unique: true
  end

  create_table "team_meetings", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "minute_taker_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "subject"
    t.text "minutes"
    t.integer "team_meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "submitter_id"
    t.text "details"
    t.index ["team_meeting_id"], name: "index_topics_on_team_meeting_id", unique: true
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 50, default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", limit: 80, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "accountant", default: false, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "wholesalers", force: :cascade do |t|
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
    t.string "country", default: "DE", null: false
    t.text "remark"
    t.string "ident"
    t.text "conditions"
  end

end
