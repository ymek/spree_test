class AddInstagramDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :ig_username, :string
    add_column :users, :ig_biography, :text
    add_column :users, :ig_website, :string
    add_column :users, :ig_profile_picture, :string
    add_column :users, :ig_full_name, :string
    add_column :users, :ig_photo_count, :integer
    add_column :users, :ig_followed_by, :integer
    add_column :users, :ig_follows, :integer
  end
end
