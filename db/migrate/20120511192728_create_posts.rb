class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :user_id
      t.string :story

      t.timestamps
    end
  end
end
