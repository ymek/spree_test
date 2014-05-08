class ChangeDefaultStoryToEmptyStringOnPosts < ActiveRecord::Migration
  def change
    change_column :posts, :story, :text, :default => ""
  end
end
