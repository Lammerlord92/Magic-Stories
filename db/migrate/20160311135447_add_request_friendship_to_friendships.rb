class AddRequestFriendshipToFriendships < ActiveRecord::Migration
  def change
    add_reference :friendships, :request_friendship, index: true, foreign_key: true
  end
end
