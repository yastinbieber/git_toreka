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

ActiveRecord::Schema.define(version: 2020_11_17_023856) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "advicediaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "idealweight_id"
    t.integer "advicemenu_id"
    t.float "weight"
    t.integer "reps"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "weightsecond"
    t.integer "repssecond"
    t.float "weightthird"
    t.integer "repsthird"
    t.text "memo"
    t.integer "useradvice_id"
    t.integer "workoutdate_id"
  end

  create_table "advicemenus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "menu"
    t.integer "minimam_reps"
    t.integer "max_reps"
    t.integer "sets"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "url"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "fooddates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "foodname"
    t.integer "gram"
    t.float "kcal"
    t.float "protein"
    t.float "fat"
    t.float "carbo"
    t.integer "inputgram"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fooddiaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "fooddate_id"
    t.integer "user_id"
    t.integer "idealweight_id"
    t.integer "gram"
    t.integer "kcal"
    t.integer "protein"
    t.integer "fat"
    t.integer "carbo"
    t.string "timing"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "foodname"
  end

  create_table "howtovideos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "target"
    t.string "menu"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "idealweights", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.float "height"
    t.float "weight"
    t.float "targetweight"
    t.float "exerciselevel"
    t.integer "period"
    t.float "basemetabolism"
    t.float "kcalburned"
    t.float "minusweight"
    t.float "minuskcal"
    t.float "kcalintake"
    t.float "intakeproteingram"
    t.float "intakeproteinkcal"
    t.float "intakefatgram"
    t.float "intakefatkcal"
    t.float "intakecarbogram"
    t.float "intakecarbokcal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.date "last_day"
    t.date "start_day"
    t.float "minusweight_day"
    t.string "email"
    t.integer "card_id"
    t.integer "fooddiary_id"
  end

  create_table "inquiries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "useradvices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "frequency"
    t.string "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "idealweight_id"
    t.datetime "deleted_at"
    t.integer "card_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.datetime "deleted_at"
    t.string "username"
    t.string "area"
    t.date "birthday"
    t.text "text"
    t.string "sex"
    t.integer "age"
    t.string "subscription_id"
    t.string "status"
    t.string "plan", default: "free"
    t.string "plan_id"
    t.integer "trial_end"
    t.string "customer_id"
    t.datetime "trial_end_day"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weightchanges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.float "todayweight"
    t.integer "idealweight_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "expected_weight"
  end

  create_table "withdrawals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workoutdates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "menu"
    t.string "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workoutdiaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "weight"
    t.integer "reps"
    t.string "settype"
    t.text "memo"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workoutdate_id"
    t.integer "user_id"
    t.float "weightsecond"
    t.integer "repssecond"
    t.float "weightthird"
    t.integer "repsthird"
    t.float "weightfourth"
    t.integer "repsfourth"
    t.float "weightfifth"
    t.integer "repsfifth"
    t.string "menu"
  end

  create_table "workoutstocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "weight"
    t.integer "reps"
    t.float "weightsecond"
    t.integer "repssecond"
    t.float "weightthird"
    t.integer "repsthird"
    t.text "memo"
    t.integer "workoutdiary_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "settype"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cards", "users"
end
