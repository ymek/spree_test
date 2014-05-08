class AddInitialBitfieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bitfields, :integer, :default => 0, :null => false
  end
end
