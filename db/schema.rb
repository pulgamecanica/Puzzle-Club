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

ActiveRecord::Schema.define(version: 2021_12_04_193316) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contributors", force: :cascade do |t|
    t.integer "puzzle_id", null: false
    t.boolean "is_finished", default: false
    t.datetime "finish_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["puzzle_id"], name: "index_contributors_on_puzzle_id"
  end

  create_table "image_memories", force: :cascade do |t|
    t.string "alt"
    t.integer "memory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active"
    t.index ["memory_id"], name: "index_image_memories_on_memory_id"
  end

  create_table "memories", force: :cascade do |t|
    t.string "user_names42"
    t.integer "puzzle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["puzzle_id"], name: "index_memories_on_puzzle_id"
  end

  create_table "puzzle_contenders", force: :cascade do |t|
    t.integer "puzzle_id", null: false
    t.integer "tournament_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["puzzle_id"], name: "index_puzzle_contenders_on_puzzle_id"
    t.index ["tournament_id"], name: "index_puzzle_contenders_on_tournament_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "pieces"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "finished"
    t.boolean "archived"
  end

  create_table "text_memories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "memory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: false
    t.index ["memory_id"], name: "index_text_memories_on_memory_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "puzzle_contender_id", null: false
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["puzzle_contender_id"], name: "index_votes_on_puzzle_contender_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "contributors", "puzzles"
  add_foreign_key "image_memories", "memories"
  add_foreign_key "memories", "puzzles"
  add_foreign_key "puzzle_contenders", "puzzles"
  add_foreign_key "puzzle_contenders", "tournaments"
  add_foreign_key "text_memories", "memories"
  add_foreign_key "votes", "puzzle_contenders"
end
