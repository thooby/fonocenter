class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nombre
      t.string :password_digest
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
