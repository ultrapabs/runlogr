class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :leader_id, null: false
      t.integer :follower_id, null: false

      t.timestamps null: false
    end

    add_index :follows, :follower_id
    add_index :follows, :leader_id

  end
end
