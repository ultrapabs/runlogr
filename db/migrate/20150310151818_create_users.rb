class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.integer :pw_digest, null: false
      t.string :session_token, null: false
      t.text :description
      t.string :photo_url

      t.timestamps null: false
    end

    add_index :users, :email
    add_index :users, :username
    add_index :users, :session_token

  end
end
