class AddTitlePointsRedeemedAndStoryPointsRedeemedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title_points_redeemed, :boolean, :default => false
    add_column :posts, :story_points_redeemed, :boolean, :default => false
  end
end
