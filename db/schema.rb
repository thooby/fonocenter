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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111107035932) do

  create_table "lugars", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registros", :force => true do |t|
    t.integer  "user_id"
    t.date     "fecha"
    t.integer  "turno_id"
    t.decimal  "llamada"
    t.decimal  "ciber"
    t.decimal  "impresion"
    t.decimal  "claro"
    t.decimal  "movistar"
    t.integer  "lugar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turnos", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "nombre"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
