class ChangeIgCaptionToText < ActiveRecord::Migration
  def change
    change_column :posts, :ig_caption, :text
  end
end
