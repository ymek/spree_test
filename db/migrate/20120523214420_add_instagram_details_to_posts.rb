class AddInstagramDetailsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :ig_filter, :string
    add_column :posts, :ig_comment_count, :integer
    add_column :posts, :ig_like_count, :integer
    add_column :posts, :ig_caption, :string
    add_column :posts, :ig_image_low_resolution, :string
    add_column :posts, :ig_image_thumbnail, :string
    add_column :posts, :ig_image_standard_resolution, :string
    add_column :posts, :ig_location, :string
    add_column :posts, :ig_created_time, :string
  end
end
