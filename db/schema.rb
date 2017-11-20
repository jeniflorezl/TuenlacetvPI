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

ActiveRecord::Schema.define(version: 20171117182432) do

  create_table "cities", force: :cascade do |t|
    t.varchar "nombre", limit: 80, null: false
    t.char "codigo", limit: 5
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.char "tipo", limit: 2, null: false
    t.char "nit", limit: 13, null: false
    t.varchar "nombre", limit: 100, null: false
    t.varchar "direccion", limit: 100, null: false
    t.varchar "telefono1", limit: 50, null: false
    t.varchar "telefono2", limit: 50
    t.varchar "fax", limit: 50
    t.varchar "contacto", limit: 100
    t.varchar "correo", limit: 100
    t.char "regimen", limit: 1
    t.varchar "actividade", limit: 80
    t.varchar "contribuyente", limit: 80
    t.varchar "resolucionCntv", limit: 150
    t.varchar "representante", limit: 150
    t.char "idciudad", limit: 1
    t.varchar "prefijo", limit: 5
    t.varchar "titulo1", limit: 100
    t.varchar "titulo2", limit: 100
    t.varchar "logo", limit: 100
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.char "tipo", limit: 2, null: false
    t.varchar "descripcion", limit: 50, null: false
    t.char "operacion", limit: 1, null: false
    t.char "clase", limit: 1, null: false
    t.float "iva", null: false
    t.char "tipodoc", limit: 3, null: false
    t.varchar "observa", limit: 100
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
  end

  create_table "sysdiagrams", primary_key: "diagram_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.integer "principal_id", null: false
    t.integer "version"
    t.binary "definition"
    t.index ["principal_id", "name"], name: "UK_principal_name", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.char "tipo", limit: 2, null: false
    t.bigint "city_id"
    t.varchar "nombre", limit: 50, null: false
    t.varchar "dirquejas", limit: 100
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
    t.index ["city_id"], name: "index_zones_on_city_id"
  end

  add_foreign_key "zones", "cities"
end
