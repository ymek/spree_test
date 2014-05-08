class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :code
      t.integer :value
      t.string :discount_type
      t.integer :usage_limit
      t.string :applies_to_resource
      t.string :applies_to_id

      t.timestamps
    end
  end
end
