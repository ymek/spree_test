class AddIgProfilePictureToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :ig_profile_picture, :string
  end
end
