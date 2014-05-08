class AddIgUsernameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :ig_username, :string
  end
end
