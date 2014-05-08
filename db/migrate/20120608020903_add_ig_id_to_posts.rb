class AddIgIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :ig_id, :string
  end
end
