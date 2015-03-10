class ChangeUserPwDigesttoString < ActiveRecord::Migration
  def change

    change_column :users, :pw_digest, :string
    
  end
end
