class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name, unique: true
      t.string :password_digest
      t.string :session_token, unique: true
      t.timestamps
    end
  add_index :users, [:user_name, :session_token], unique: true
  end
end
