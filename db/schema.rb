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

ActiveRecord::Schema[7.1].define(version: 2024_03_06_050557) do
  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.string "subbreed"
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["owner_id"], name: "index_dogs_on_owner_id"
  end

  create_table "family_owner_joins", force: :cascade do |t|
    t.integer "family_owner_id", null: false
    t.integer "person_id", null: false
    t.integer "gooddog_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_owner_id"], name: "index_family_owner_joins_on_family_owner_id"
    t.index ["gooddog_id"], name: "index_family_owner_joins_on_gooddog_id"
    t.index ["person_id"], name: "index_family_owner_joins_on_person_id"
  end

  create_table "family_owners", force: :cascade do |t|
    t.string "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gooddogs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "favoritetreat"
    t.integer "breed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed_id"], name: "index_gooddogs_on_breed_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dogs", "owners"
  add_foreign_key "family_owner_joins", "family_owners"
  add_foreign_key "family_owner_joins", "gooddogs"
  add_foreign_key "family_owner_joins", "people"
  add_foreign_key "gooddogs", "breeds"
end
