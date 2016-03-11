class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  belongs_to :request_friendship, class_name: 'RequestFriendship', foreign_key: 'request_friendship_id'

  validates :user, uniqueness: {scope: :friend}

  def self.createFriendship(peticion)
    self.create!({user_id: peticion.sender_id, friend_id: peticion.recipient_id, request_friendship: peticion})
    self.create!({user_id: peticion.recipient_id, friend_id: peticion.sender_id, request_friendship: peticion})
  end

end
