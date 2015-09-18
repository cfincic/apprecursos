# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150204221530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agentes", force: true do |t|
    t.string   "cuil"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "num_legajo"
    t.integer  "tipo_documento_id"
    t.integer  "localidad_id"
    t.integer  "provincia_id"
    t.string   "numero_doc"
    t.datetime "fecha_nac"
    t.string   "lugar_nac"
    t.string   "nacionalidad"
    t.string   "estado_civil"
    t.string   "telefono_casa"
    t.string   "telefono_celu"
    t.string   "email"
    t.string   "direccion"
    t.string   "cod_postal"
    t.string   "provincia"
    t.string   "otro"
    t.boolean  "es_discapacitado"
    t.datetime "expira_certificado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agentes", ["localidad_id"], name: "index_agentes_on_localidad_id", using: :btree
  add_index "agentes", ["provincia_id"], name: "index_agentes_on_provincia_id", using: :btree
  add_index "agentes", ["tipo_documento_id"], name: "index_agentes_on_tipo_documento_id", using: :btree

  create_table "contactos", force: true do |t|
    t.string   "telefono"
    t.string   "email"
    t.integer  "agente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contactos", ["agente_id"], name: "index_contactos_on_agente_id", using: :btree

  create_table "dato_contactos", force: true do |t|
    t.string   "telefono_casa"
    t.string   "telefono_celu"
    t.string   "email"
    t.string   "direccion"
    t.string   "ciudad"
    t.string   "cod_postal"
    t.string   "provincia"
    t.string   "otro"
    t.integer  "agente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dato_contactos", ["agente_id"], name: "index_dato_contactos_on_agente_id", using: :btree

  create_table "dato_laborals", force: true do |t|
    t.integer  "agente_id"
    t.integer  "sede_id"
    t.integer  "interno"
    t.datetime "fecha_ingreso"
    t.integer  "situ_revista"
    t.string   "agrupamiento"
    t.string   "nivel"
    t.string   "grado"
    t.string   "tramo"
    t.string   "cargo"
    t.text     "obj_cargo"
    t.text     "tareas_cargo"
    t.string   "depende_direccion"
    t.integer  "jefe_directo"
    t.decimal  "sueldo_bruto"
    t.decimal  "sueldo_neto"
    t.integer  "cant_personas_acargo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dato_laborals", ["agente_id"], name: "index_dato_laborals_on_agente_id", using: :btree
  add_index "dato_laborals", ["sede_id"], name: "index_dato_laborals_on_sede_id", using: :btree

  create_table "familiars", force: true do |t|
    t.string   "relacion"
    t.string   "cuil"
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "fecha_nac"
    t.string   "lugar_nac"
    t.integer  "agente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "familiars", ["agente_id"], name: "index_familiars_on_agente_id", using: :btree

  create_table "localidades", force: true do |t|
    t.string   "codigo",       null: false
    t.string   "detalle",      null: false
    t.integer  "provincia_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "localidades", ["provincia_id"], name: "index_localidades_on_provincia_id", using: :btree

  create_table "provincias", force: true do |t|
    t.string   "codigo",     null: false
    t.string   "detalle",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sedes", force: true do |t|
    t.string   "descripcion"
    t.string   "direccion"
    t.string   "telefono1"
    t.string   "telefono2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "situacion_revista", force: true do |t|
    t.string   "descripcion"
    t.datetime "fecha_alta"
    t.integer  "dato_laboral_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_documentos", force: true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
