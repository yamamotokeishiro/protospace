module PrototypeHelper
  def likes_counter(likes)
    likes.count
  end

  def likes_user(user)
    likes = @likes.find_by(user_id: user)
    return likes
  end
end
