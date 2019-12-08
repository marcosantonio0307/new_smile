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

ActiveRecord::Schema.define(version: 2019_12_04_015516) do

  create_table "procedures", force: :cascade do |t|
    t.string "patient"
    t.string "doctor"
    t.date "date_procedure"
    t.string "sex"
    t.string "city"
    t.string "note"
    t.string "last_procedure"
    t.string "reason"
    t.string "motivation"
    t.string "drugs"
    t.string "contraceptive"
    t.string "anomaly"
    t.string "bone_development"
    t.string "physical_type"
    t.string "height"
    t.string "weight"
    t.string "last_surgery"
    t.string "cheers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_1"
    t.integer "item_2"
    t.integer "item_3"
    t.integer "item_4"
    t.integer "item_5"
    t.integer "item_6"
    t.integer "item_7"
    t.integer "item_8"
    t.integer "item_9"
    t.integer "item_10"
    t.integer "item_11"
    t.integer "item_12"
    t.integer "item_13"
    t.integer "item_14"
    t.integer "item_15"
    t.integer "item_16"
    t.integer "item_17"
    t.integer "item_18"
    t.integer "item_19"
  end

end
