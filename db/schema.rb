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

ActiveRecord::Schema.define(version: 20150131000828) do

  create_table "calendarios", force: :cascade do |t|
    t.integer  "processo_seletivo_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "calendarios", ["processo_seletivo_id"], name: "index_calendarios_on_processo_seletivo_id"

  create_table "cidades", force: :cascade do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id"

  create_table "editals", force: :cascade do |t|
    t.string   "numero"
    t.string   "descricao"
    t.date     "data_publicacao"
    t.binary   "arquivo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos_calendarios", force: :cascade do |t|
    t.date     "data_inicial"
    t.date     "data_final"
    t.string   "observacao"
    t.integer  "evento_id"
    t.integer  "calendario_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "eventos_calendarios", ["calendario_id"], name: "index_eventos_calendarios_on_calendario_id"
  add_index "eventos_calendarios", ["evento_id"], name: "index_eventos_calendarios_on_evento_id"

  create_table "linha_pesquisas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.date     "data_nascimento"
    t.string   "naturalidade"
    t.string   "nacionalidade"
    t.string   "estado_civil"
    t.string   "grau_formacao"
    t.string   "logradouro"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.integer  "estado_id"
    t.string   "cep"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pessoas", ["estado_id"], name: "index_pessoas_on_estado_id"
  add_index "pessoas", ["user_id"], name: "index_pessoas_on_user_id"

  create_table "processo_seletivos", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "edital_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "calendarios_id"
    t.integer  "calendario_id"
  end

  add_index "processo_seletivos", ["calendarios_id"], name: "index_processo_seletivos_on_calendarios_id"
  add_index "processo_seletivos", ["edital_id"], name: "index_processo_seletivos_on_edital_id"

  create_table "processo_seletivos_linha_pesquisas", id: false, force: :cascade do |t|
    t.integer "processo_seletivo_id"
    t.integer "linha_pesquisa_id"
  end

  add_index "processo_seletivos_linha_pesquisas", ["processo_seletivo_id", "linha_pesquisa_id"], name: "index_processo_seletivos_linha_pesquisas", unique: true

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
