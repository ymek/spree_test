class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :text
      t.string :ig_username
      t.string :ig_profile_picture
      t.integer :ig_id
      t.string :ig_full_name

      t.timestamps
    end
  end
end
