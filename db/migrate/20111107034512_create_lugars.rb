class CreateLugars < ActiveRecord::Migration
  def self.up
    create_table :lugars do |t|
      t.string :nombre
      t.timestamps
    end
  end

  def self.down
    drop_table :lugars
  end
end
