require 'active_support/concern'

module User::PointsUpdater
  extend ActiveSupport::Concern

  def can_add_points?
    # allow user to add points if < 5 photos added today
    return self.posts.during_last(24.hours).count < 5
  end

  def add_points(add_points=0)
    self.update_attributes(points: self.points + add_points) if add_points > 0
  end

  def deduct_points(deduct_points=0)
    return if deduct_points == 0
    self.points - deduct_points >= 0 ? new_points = self.points - deduct_points : new_points = 0
    self.update_attributes(points: new_points)
  end

  def points_html
    return "&#8734;" if username == "boombotix"
    return self.points
  end

  def retroactively_add_points
    # run thru all posts & see if any have
    # ig_username of (self) but no local user_id
    points_to_add = 0
    Post.where(ig_username: self.ig_username, user_id: nil).find_each do |post|
      link_to_user(post)

      # count the # of comments and likes on post with your ig_username
      comment_count = post.comments.where("user_id IS NULL or user_id != ?", self.id).count
      like_count    = post.likes.where("user_id IS NULL or user_id != ?", self.id).count

      # apply simple multiplication to add points
      points_to_add += (2 + (comment_count * 2) + (like_count * 1))
    end

    # update points
    self.add_points(points_to_add)
  end
end
