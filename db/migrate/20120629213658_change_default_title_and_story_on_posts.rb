class ChangeDefaultTitleAndStoryOnPosts < ActiveRecord::Migration
  def change
    change_column :posts, :story, :string, :default => ""
    change_column :posts, :title, :string, :default => ""
  end
end
