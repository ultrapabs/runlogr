class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :author_id, null: false
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end

    add_index :users, :description
  end
end
