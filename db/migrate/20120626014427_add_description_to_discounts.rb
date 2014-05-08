class AddDescriptionToDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :description, :string
  end
end
