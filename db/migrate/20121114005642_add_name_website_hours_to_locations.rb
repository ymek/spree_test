class AddNameWebsiteHoursToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :name, :string
    add_column :locations, :website, :string
    add_column :locations, :hours, :text
  end
end
