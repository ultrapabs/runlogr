class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :user_id, null: false
      t.string :title
      t.date :date, null: false
      t.float :distance, null: false
      t.float :duration, null: false
      t.text :notes

      t.timestamps null: false
    end
    add_index :logs, :date
    add_index :logs, :title
    add_index :logs, :user_id


    add_index :blogs, :title
    add_index :blogs, :author_id
  end
end
