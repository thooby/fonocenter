class CreateRegistros < ActiveRecord::Migration
  def self.up
    create_table :registros do |t|
      t.integer :user_id
      t.date :fecha
      t.integer :turno_id
      t.decimal :llamada
      t.decimal :ciber
      t.decimal :impresion
      t.decimal :claro
      t.decimal :movistar
      t.integer :lugar_id
      t.timestamps
    end
  end

  def self.down
    drop_table :registros
  end
end
