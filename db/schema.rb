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

ActiveRecord::Schema.define(version: 20150127232901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agentes", force: true do |t|
    t.integer  "legajo"
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agrentes", force: true do |t|
    t.string   "cuil"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "tipo_documento_id"
    t.string   "numero_doc"
    t.datetime "fecha_nac"
    t.string   "lugar_nac"
    t.string   "nacionalidad"
    t.string   "estado_civil"
    t.boolean  "es_discapacitado"
    t.datetime "expira_certificado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agrentes", ["tipo_documento_id"], name: "index_agrentes_on_tipo_documento_id", using: :btree

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
    t.integer  "agrente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dato_contactos", ["agrente_id"], name: "index_dato_contactos_on_agrente_id", using: :btree

  create_table "familiars", force: true do |t|
    t.string   "relacion"
    t.string   "cuil"
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "fecha_nac"
    t.string   "lugar_nac"
    t.integer  "agrente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "familiars", ["agrente_id"], name: "index_familiars_on_agrente_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_documentos", force: true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
