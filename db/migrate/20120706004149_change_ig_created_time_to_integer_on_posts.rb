class ChangeIgCreatedTimeToIntegerOnPosts < ActiveRecord::Migration
  # def change
  #   change_column :posts, :ig_created_time, :integer
  # end

  def up
    execute 'ALTER TABLE posts ALTER COLUMN ig_created_time TYPE integer USING (ig_created_time::integer)'
  end

  def down
    execute 'ALTER TABLE posts ALTER COLUMN ig_created_time TYPE text USING (ig_created_time::text)'
  end
end
