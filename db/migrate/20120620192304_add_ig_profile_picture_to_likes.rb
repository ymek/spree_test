class AddIgProfilePictureToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :ig_profile_picture, :string
  end
end
