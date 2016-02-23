class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  belongs_to :request_friendship

  validates :user, uniqueness: {scope: :friend}
  validates :request_friendship, allow_nil: false

  def self.createFriendship(friend1, friend2)
    self.create({user_id: friend1.id, friend_id: friend2.id})
    self.create({user_id: friend2.id, friend_id: friend1.id})
  end

end
