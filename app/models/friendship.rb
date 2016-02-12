class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"



  def self.createFriendship(friend1, friend2)
    self.create({user_id: friend1.id, friend_id: friend2.id})
    self.create({user_id: friend2.id, friend_id: friend1.id})

  end
end
