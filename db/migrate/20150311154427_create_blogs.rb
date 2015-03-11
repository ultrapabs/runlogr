class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :author_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.text :preview

      t.timestamps
    end
  end
end
