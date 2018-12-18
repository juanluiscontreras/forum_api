class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, limit: 50
      t.string :password
      t.string :encrypted_password
      t.string :screen_name, limit: 50
      t.string :email, limit: 50
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
