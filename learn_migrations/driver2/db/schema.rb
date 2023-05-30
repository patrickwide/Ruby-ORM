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

ActiveRecord::Schema[7.0].define(version: 2023_05_30_202728) do
  create_table "cars", force: :cascade do |t|
    t.integer "driver_id"
    t.string "numberplate"
    t.string "color"
    t.string "model"
    t.integer "no_of_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_cars_on_driver_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_name"
    t.string "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "driver_name"
    t.string "phone_no"
    t.string "license"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "car_id"
    t.string "destination"
    t.string "pick_up_location"
    t.decimal "price"
    t.integer "total_passengers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_trips_on_car_id"
    t.index ["customer_id"], name: "index_trips_on_customer_id"
  end

end
