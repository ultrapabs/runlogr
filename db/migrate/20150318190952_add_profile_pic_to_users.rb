class AddProfilePicToUsers < ActiveRecord::Migration
  def self.up
    add_attachment :users, :profile_pic
  end

  def self.down
    remove_attachment :users, :picture
  end
end
