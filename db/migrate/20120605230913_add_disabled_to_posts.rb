class AddDisabledToPosts < ActiveRecord::Migration
  def change
		add_column :posts, :disabled, :boolean, :default => false
  end
end
