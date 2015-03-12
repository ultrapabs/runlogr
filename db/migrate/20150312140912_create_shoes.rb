class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.float :distance, null: false

      t.timestamps null: false
    end

    add_index :shoes, :name
    add_index :shoes, :user_id

    add_column :logs, :shoe_id, :integer
  end
end
