class AddIgCreatedTimeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :ig_created_time, :string
  end
end
