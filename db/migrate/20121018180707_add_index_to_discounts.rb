class AddIndexToDiscounts < ActiveRecord::Migration
  def change
    add_index :discounts, :user_id
  end
end
