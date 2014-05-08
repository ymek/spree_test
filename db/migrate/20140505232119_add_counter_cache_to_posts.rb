class AddCounterCacheToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :comments_count, :integer, default: 0
    Post.reset_column_information
    Post.find_each do |post|
      Post.delay.reset_counters(post.id, :comments)
    end
  end

  def down
    remove_column :posts, :comments_count
  end
end
