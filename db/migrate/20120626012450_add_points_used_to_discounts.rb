class AddPointsUsedToDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :points_used, :integer
  end
end
