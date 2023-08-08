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

ActiveRecord::Schema[7.0].define(version: 2023_08_08_123726) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "custom_join_table_name", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "depense_id", null: false
    t.index ["depense_id", "group_id"], name: "index_custom_join_table_name_on_depense_id_and_group_id"
    t.index ["group_id", "depense_id"], name: "index_custom_join_table_name_on_group_id_and_depense_id"
  end

  create_table "depenses", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_depenses_on_user_id"
  end

  create_table "depenses_groups", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "depense_id", null: false
    t.index ["depense_id", "group_id"], name: "index_depenses_groups_on_depense_id_and_group_id"
    t.index ["group_id", "depense_id"], name: "index_depenses_groups_on_group_id_and_depense_id"
  end

  create_table "group_depenses", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "depense_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["depense_id"], name: "index_group_depenses_on_depense_id"
    t.index ["group_id"], name: "index_group_depenses_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "depenses", "users"
  add_foreign_key "group_depenses", "depenses"
  add_foreign_key "group_depenses", "groups"
  add_foreign_key "groups", "users"
end
