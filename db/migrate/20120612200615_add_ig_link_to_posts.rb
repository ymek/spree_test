class AddIgLinkToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :ig_link, :string
  end
end
