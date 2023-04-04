# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_230_331_210_914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'deck_cards', force: :cascade do |t|
    t.bigint 'deck_id'
    t.bigint 'sound_card_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['deck_id'], name: 'index_deck_cards_on_deck_id'
    t.index ['sound_card_id'], name: 'index_deck_cards_on_sound_card_id'
  end

  create_table 'decks', force: :cascade do |t|
    t.string 'category'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'leaderboards', force: :cascade do |t|
    t.string 'name'
    t.integer 'score'
    t.string 'category'
    t.string 'difficulty'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'sound_cards', force: :cascade do |t|
    t.string 'correct_answer'
    t.string 'category'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'wrong_answers', force: :cascade do |t|
    t.bigint 'sound_card_id'
    t.string 'answer'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['sound_card_id'], name: 'index_wrong_answers_on_sound_card_id'
  end

  add_foreign_key 'deck_cards', 'decks'
  add_foreign_key 'deck_cards', 'sound_cards'
  add_foreign_key 'wrong_answers', 'sound_cards'
end
