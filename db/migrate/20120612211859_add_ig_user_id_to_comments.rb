class AddIgUserIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :ig_user_id, :string
  end
end
