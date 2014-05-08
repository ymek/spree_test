class AddIgPostIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :ig_post_id, :string
  end
end
