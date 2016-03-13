class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  belongs_to :request_friendship, class_name: 'RequestFriendship', foreign_key: 'request_friendship_id'

  validates :user, uniqueness: {scope: :friend}

  def self.createFriendship(peticion)
    self.create!({user_id: peticion.sender_id, friend_id: peticion.recipient_id, request_friendship: peticion})
    self.create!({user_id: peticion.recipient_id, friend_id: peticion.sender_id, request_friendship: peticion})
  end

  def self.are_friends?(user1, user2)
    if user1.id == user2.id
      return true # Porque uno es amigo de sí mismo ;)
    end
    friendship1 = Friendship.where(user_id: user1.id, friend_id: user2.id).first
    friendship2 = Friendship.where(user_id: user2.id, friend_id: user1.id).first
    if friendship1.present?
      return friendship1.request_friendship.status == 'ACCEPTED'
    end
    if friendship2.present?
      return friendship1.request_friendship.status == 'ACCEPTED'
    end
    if !friendship1.present? and !friendship2.present?
      return false
    end
  end

end
