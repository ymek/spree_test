class AddIgUsernameToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :ig_username, :string
  end
end
