class ChangeIgIdToStringOnComments < ActiveRecord::Migration
	def change
		change_column :comments, :ig_id, :string
	end
end
