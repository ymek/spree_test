class AddIgUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ig_user_id, :string
  end
end
