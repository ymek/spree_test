class AddAdminUserIdToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :admin_user_id, :integer
  end
end
