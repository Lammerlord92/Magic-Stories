module ConnectionsHelper
  begin_action authenticate!

  def searchFollowers(qu)
    current_user.profile.followers.where({name: "%#{qu}%"})
  end


  def searchFollowing(qu)
    current_user.profile.followees.where({name: "%#{qu}%"})

  def searchFriends(qu)
    queryUser = '(lower(name) like :q OR lower(surname1) like :q OR lower(surname2) like :q OR lower(email) like :q OR lower(username) like :q)'
    subquery = '(friendships.user_id != :cu_id and friendships.friend_id = :cu_id)'
    profiles = Profile.distinct(:user_id).joins(:friendships).where(subquery, {cu_id: current_user.id}).where(user_id: User.where(queryUser, {q: "%#{qu}%"}))
    profiles
  end


end
