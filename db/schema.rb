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

ActiveRecord::Schema.define(version: 2020_02_26_164836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "ability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string "move"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_poke_abilities", force: :cascade do |t|
    t.bigint "my_pokemon_id"
    t.bigint "ability_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability_id"], name: "index_my_poke_abilities_on_ability_id"
    t.index ["my_pokemon_id", "ability_id"], name: "index_my_poke_abilities_on_my_pokemon_id_and_ability_id", unique: true
    t.index ["my_pokemon_id"], name: "index_my_poke_abilities_on_my_pokemon_id"
  end

  create_table "my_poke_items", force: :cascade do |t|
    t.bigint "my_pokemon_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_my_poke_items_on_item_id"
    t.index ["my_pokemon_id", "item_id"], name: "index_my_poke_items_on_my_pokemon_id_and_item_id", unique: true
    t.index ["my_pokemon_id"], name: "index_my_poke_items_on_my_pokemon_id"
  end

  create_table "my_poke_moves", force: :cascade do |t|
    t.bigint "my_pokemon_id"
    t.bigint "move_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["move_id"], name: "index_my_poke_moves_on_move_id"
    t.index ["my_pokemon_id", "move_id"], name: "index_my_poke_moves_on_my_pokemon_id_and_move_id", unique: true
    t.index ["my_pokemon_id"], name: "index_my_poke_moves_on_my_pokemon_id"
  end

  create_table "my_pokemons", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pokemon_id"
    t.integer "ev_h"
    t.integer "ev_a"
    t.integer "ev_b"
    t.integer "ev_c"
    t.integer "ev_d"
    t.integer "ev_s"
    t.integer "iv_h"
    t.integer "iv_a"
    t.integer "iv_b"
    t.integer "iv_c"
    t.integer "iv_d"
    t.integer "iv_s"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status_up"
    t.integer "status_down"
    t.index ["pokemon_id"], name: "index_my_pokemons_on_pokemon_id"
    t.index ["user_id", "pokemon_id"], name: "index_my_pokemons_on_user_id_and_pokemon_id"
    t.index ["user_id"], name: "index_my_pokemons_on_user_id"
  end

  create_table "poke_abilities", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "ability_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability_id"], name: "index_poke_abilities_on_ability_id"
    t.index ["pokemon_id", "ability_id"], name: "index_poke_abilities_on_pokemon_id_and_ability_id", unique: true
    t.index ["pokemon_id"], name: "index_poke_abilities_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.integer "type1"
    t.integer "type2"
    t.string "form"
    t.integer "bs_h"
    t.integer "bs_a"
    t.integer "bs_b"
    t.integer "bs_c"
    t.integer "bs_d"
    t.integer "bs_s"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "form_name"
    t.string "full_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "my_poke_abilities", "abilities"
  add_foreign_key "my_poke_abilities", "my_pokemons"
  add_foreign_key "my_poke_items", "items"
  add_foreign_key "my_poke_items", "my_pokemons"
  add_foreign_key "my_poke_moves", "moves"
  add_foreign_key "my_poke_moves", "my_pokemons"
  add_foreign_key "my_pokemons", "pokemons"
  add_foreign_key "my_pokemons", "users"
  add_foreign_key "poke_abilities", "abilities"
  add_foreign_key "poke_abilities", "pokemons"
end
