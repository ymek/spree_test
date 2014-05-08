class ChangeIgCaptionDefaultToBlankString < ActiveRecord::Migration
  def change
    change_column :posts, :ig_caption, :text, :default => ""
  end
end
