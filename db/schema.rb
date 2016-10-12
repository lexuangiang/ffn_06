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

ActiveRecord::Schema.define(version: 20161011040243) do

  create_table "bets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "home_coin",  limit: 24
    t.float    "away_coin",  limit: 24
    t.boolean  "bet_status"
    t.integer  "user_id"
    t.integer  "match_id"
    t.integer  "score_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["match_id"], name: "index_bets_on_match_id", using: :btree
    t.index ["score_id"], name: "index_bets_on_score_id", using: :btree
    t.index ["user_id"], name: "index_bets_on_user_id", using: :btree
  end

  create_table "category_match_rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category_rates"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "category_news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "clubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "club_name"
    t.string   "location"
    t.string   "stadium"
    t.string   "coach"
    t.date     "founding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "match_date"
    t.time     "match_time"
    t.integer  "home_goal"
    t.integer  "away_goal"
    t.boolean  "match_status"
    t.integer  "home_id"
    t.integer  "away_id"
    t.integer  "rate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["rate_id"], name: "index_matches_on_rate_id", using: :btree
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "body",             limit: 65535
    t.integer  "category_news_id"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image"
    t.index ["category_news_id"], name: "index_news_on_category_news_id", using: :btree
    t.index ["user_id"], name: "index_news_on_user_id", using: :btree
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "player_name"
    t.string   "nationality"
    t.string   "position"
    t.float    "height",      limit: 24
    t.float    "weight",      limit: 24
    t.integer  "club_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image"
    t.index ["club_id"], name: "index_players_on_club_id", using: :btree
  end

  create_table "ranks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "rank_score"
    t.integer  "club_id"
    t.integer  "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_ranks_on_club_id", using: :btree
    t.index ["session_id"], name: "index_ranks_on_session_id", using: :btree
  end

  create_table "rate_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "rate_score", limit: 24
    t.integer  "score_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["score_id"], name: "index_rate_scores_on_score_id", using: :btree
  end

  create_table "rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "rate_name"
    t.float    "home_rate",              limit: 24
    t.float    "away_rate",              limit: 24
    t.integer  "category_match_rate_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["category_match_rate_id"], name: "index_rates_on_category_match_rate_id", using: :btree
  end

  create_table "scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "home_score"
    t.integer  "away_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "session_name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_name"
    t.string   "email"
    t.boolean  "isadmin"
    t.float    "coin",            limit: 24
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "password_digest"
  end

  add_foreign_key "bets", "matches"
  add_foreign_key "bets", "scores"
  add_foreign_key "bets", "users"
  add_foreign_key "matches", "rates"
  add_foreign_key "news", "category_news"
  add_foreign_key "news", "users"
  add_foreign_key "players", "clubs"
  add_foreign_key "ranks", "clubs"
  add_foreign_key "ranks", "sessions"
  add_foreign_key "rate_scores", "scores"
  add_foreign_key "rates", "category_match_rates"
end
