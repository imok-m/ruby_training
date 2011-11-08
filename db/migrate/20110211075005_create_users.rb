class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :login_count
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.boolean :admin_flag, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
