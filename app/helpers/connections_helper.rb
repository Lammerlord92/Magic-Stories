module ConnectionsHelper

#Los métodos de socialization devuelven un array con los perfiles no devuelven
#un ActiveRecord por tanto no se puede ejecutar consultas sobre ellos
#por ello mapeamos el array de "hashes"

  def searchFollowers(qu)
    arr = current_user.profile.followers(Profile)
    profiles = Profile.where({id: arr.map(&:id)}, "lower(name) = ?", "%#{qu}%")
    profiles

  end


  def searchFollowees(qu)
    arr = current_user.profile.followees(Profile)
    profiles = Profile.where({id: arr.map(&:id)}, "lower(name) = ?", "%#{qu}%")
    profiles
  end

  def searchFriends(qu)
    queryUser = '(lower(name) like :q OR lower(surname1) like :q OR lower(surname2) like :q OR lower(email) like :q OR lower(username) like :q)'
    subquery = '(friendships.user_id != :cu_id and friendships.friend_id = :cu_id)'
    profiles = Profile.distinct(:user_id).joins(:friendships).where(subquery, {cu_id: current_user.id}).where(user_id: User.where(queryUser, {q: "%#{qu}%"}))
    profiles
  end


end
