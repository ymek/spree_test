class AddSwagonomicsUserIdToSpreePromotions < ActiveRecord::Migration
  def change
    add_column :spree_activators, :swagonomics_user_id, :integer, :default => nil
  end
end
