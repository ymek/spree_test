class AddInitialFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer
    add_column :users, :redeemed_count, :integer
    add_column :users, :last_redeemed, :datetime
  end
end
