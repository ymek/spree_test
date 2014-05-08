class AddIgUserIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :ig_user_id, :integer
  end
end
