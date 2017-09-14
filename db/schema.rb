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

ActiveRecord::Schema.define(version: 20170914004745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "service_id"
    t.decimal  "commission"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "description"
    t.integer  "employee_id"
    t.integer  "service_id"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "telephone"
    t.string   "cellphone"
    t.string   "zipcode"
    t.integer  "number"
    t.string   "street"
    t.string   "cpf"
    t.date     "birthday"
    t.integer  "sex"
    t.string   "district"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "employee_id"
    t.date    "start_date"
    t.date    "end_date"
    t.time    "start_time"
    t.time    "end_time"
    t.integer "status"
  end

  create_table "employees", force: :cascade do |t|
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
    t.string   "name",                                null: false
    t.string   "telephone"
    t.string   "cellphone"
    t.string   "zipcode"
    t.integer  "number"
    t.string   "street"
    t.string   "cpf"
    t.date     "birthdate"
    t.string   "identity"
    t.string   "work_paper"
    t.integer  "gender"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_employees_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
  end

  create_table "intervals", force: :cascade do |t|
    t.time    "start_time"
    t.time    "end_time"
    t.integer "contract_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "discount"
    t.integer  "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "quantity"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "saloons", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "cnpj"
    t.string   "zipcode"
    t.string   "street"
    t.string   "complement"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "sunday"
    t.integer "monday"
    t.integer "tuesday"
    t.integer "wednesday"
    t.integer "thurdsay"
    t.integer "friday"
    t.integer "saturday"
    t.integer "contract_id"
  end

end
