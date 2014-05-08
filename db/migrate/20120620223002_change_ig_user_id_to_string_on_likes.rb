class ChangeIgUserIdToStringOnLikes < ActiveRecord::Migration
  def change
  	change_column :likes, :ig_user_id, :string
  end
end
