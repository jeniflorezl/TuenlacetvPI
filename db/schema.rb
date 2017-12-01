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

ActiveRecord::Schema.define(version: 20171124032828) do

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

  create_table "entities", force: :cascade do |t|
    t.bigint "function_id"
    t.bigint "person_id"
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
    t.index ["function_id"], name: "index_entities_on_function_id"
    t.index ["person_id"], name: "index_entities_on_person_id"
  end

  create_table "functions", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.bigint "zone_id"
    t.varchar "nombre", limit: 50, null: false
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
    t.index ["zone_id"], name: "index_neighborhoods_on_zone_id"
  end

  create_table "people", force: :cascade do |t|
    t.bigint "type_document_id"
    t.varchar "documento", limit: 12, null: false
    t.varchar "nombre1", limit: 50, null: false
    t.varchar "nombre2", limit: 50
    t.varchar "apellido1", limit: 50, null: false
    t.varchar "apellido2", limit: 50
    t.varchar "direccion", limit: 200
    t.bigint "neighborhood_id"
    t.bigint "zone_id"
    t.varchar "telefono1", limit: 20
    t.varchar "telefono2", limit: 20
    t.varchar "correo", limit: 50
    t.datetime "fechanac"
    t.char "tipopersona", limit: 2, null: false
    t.integer "estrato"
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
    t.index ["neighborhood_id"], name: "index_people_on_neighborhood_id"
    t.index ["type_document_id"], name: "index_people_on_type_document_id"
    t.index ["zone_id"], name: "index_people_on_zone_id"
  end

  create_table "plans", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
  end

  create_table "rates", force: :cascade do |t|
    t.bigint "zone_id"
    t.bigint "concept_id"
    t.bigint "plan_id"
    t.money "valor", precision: 19, scale: 4, null: false
    t.char "estado", limit: 1
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
    t.index ["concept_id"], name: "index_rates_on_concept_id"
    t.index ["plan_id"], name: "index_rates_on_plan_id"
    t.index ["zone_id"], name: "index_rates_on_zone_id"
  end

  create_table "services", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
  end

  create_table "signal_tvs", force: :cascade do |t|
    t.bigint "entity_id"
    t.varchar "contrato", limit: 20
    t.varchar "direccion", limit: 200
    t.varchar "urbanizacion", limit: 200
    t.varchar "torre", limit: 20
    t.varchar "apto", limit: 20
    t.integer "estrato"
    t.varchar "vivienda", limit: 20
    t.varchar "telefono1", limit: 20
    t.varchar "telefono2", limit: 20
    t.varchar "contacto", limit: 20
    t.bigint "neighborhood_id"
    t.bigint "zone_id"
    t.datetime "fechacontrato", null: false
    t.integer "numerotvs"
    t.char "estado", limit: 1, null: false
    t.bigint "rate_id"
    t.varchar "precinto", limit: 10
    t.bigint "type_installation_id"
    t.bigint "technology_id"
    t.varchar "tiposervicio", limit: 20
    t.varchar "areainstalacion", limit: 20
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
    t.index ["entity_id"], name: "index_signal_tvs_on_entity_id"
    t.index ["neighborhood_id"], name: "index_signal_tvs_on_neighborhood_id"
    t.index ["rate_id"], name: "index_signal_tvs_on_rate_id"
    t.index ["technology_id"], name: "index_signal_tvs_on_technology_id"
    t.index ["type_installation_id"], name: "index_signal_tvs_on_type_installation_id"
    t.index ["zone_id"], name: "index_signal_tvs_on_zone_id"
  end

  create_table "sysdiagrams", primary_key: "diagram_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.integer "principal_id", null: false
    t.integer "version"
    t.binary "definition"
    t.index ["principal_id", "name"], name: "UK_principal_name", unique: true
  end

  create_table "technologies", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
  end

  create_table "type_documents", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
  end

  create_table "type_installations", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
  end

  create_table "users", force: :cascade do |t|
    t.varchar "login", limit: 10, null: false
    t.varchar "nombre", limit: 80, null: false
    t.varchar "clave", limit: 15, null: false
    t.char "nivel", limit: 1
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
  end

  create_table "zones", force: :cascade do |t|
    t.bigint "city_id"
    t.varchar "nombre", limit: 50, null: false
    t.datetime "fechacre", default: -> { "getdate()" }
    t.datetime "fechacam", default: -> { "getdate()" }
    t.varchar "usuario", limit: 15, null: false
    t.index ["city_id"], name: "index_zones_on_city_id"
  end

  add_foreign_key "entities", "functions"
  add_foreign_key "entities", "people"
  add_foreign_key "neighborhoods", "zones"
  add_foreign_key "people", "neighborhoods"
  add_foreign_key "people", "type_documents"
  add_foreign_key "people", "zones"
  add_foreign_key "rates", "concepts"
  add_foreign_key "rates", "plans"
  add_foreign_key "rates", "zones"
  add_foreign_key "signal_tvs", "entities"
  add_foreign_key "signal_tvs", "neighborhoods"
  add_foreign_key "signal_tvs", "rates"
  add_foreign_key "signal_tvs", "technologies"
  add_foreign_key "signal_tvs", "type_installations"
  add_foreign_key "signal_tvs", "zones"
  add_foreign_key "zones", "cities"
end
