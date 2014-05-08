class ChangeStoryToStringOnPosts < ActiveRecord::Migration
  def change
    change_column :posts, :story, :text
  end
end
