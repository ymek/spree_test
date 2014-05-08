class ChangeIgCreatedTimeToIntegerOnComments < ActiveRecord::Migration
  # def change
  #   change_column :comments, :ig_created_time, :integer
  # end

  def up
    execute 'ALTER TABLE comments ALTER COLUMN ig_created_time TYPE integer USING (ig_created_time::integer)'
  end

  def down
    execute 'ALTER TABLE comments ALTER COLUMN ig_created_time TYPE text USING (ig_created_time::text)'
  end

end
