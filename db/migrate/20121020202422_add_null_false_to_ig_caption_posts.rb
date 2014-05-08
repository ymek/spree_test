class AddNullFalseToIgCaptionPosts < ActiveRecord::Migration
  def change
    change_column :posts, :ig_caption, :text, :default => "", :null => false
  end
end
