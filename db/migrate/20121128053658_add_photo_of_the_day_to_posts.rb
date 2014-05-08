class AddPhotoOfTheDayToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :photo_of_the_day, :boolean, :default => false
    change_column :posts, :story, :text, :default => ""
  end
end
