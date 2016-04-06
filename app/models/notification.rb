class Notification < ActiveRecord::Base
  belongs_to :feed, polymorphic: true
  belongs_to :source, class_name: "User"
  belongs_to :outcome, class_name: "User"





def self.feedRequestFriendship(feed)
  self.create({feed_type: feed.class.name, feed_id: feed.id, source: User.find(feed.sender_id), outcome: User.find(feed.recipient_id), checked: false })
end

def self.feedNewFriendship(feed)
  self.create({feed_type: feed.class.name, feed_id: feed.id, source: User.find(feed.user_id), outcome: User.find(feed.friend_id), checked: false })
  self.create({feed_type: feed.class.name, feed_id: feed.id, source: User.find(feed.friend_id), outcome: User.find(feed.user_id), checked: false })
end

# Se usa para notificar peticiones de amistad y otras futuras. Por eso se hace générico
# Se le pasa:
#   - RequestFriendship: en caso de que sea una petición de amistad
#   - Friendship: en caso de que queramos notificar una nueva amistad

def self.notificate(feed)
  a = feed.class.name
  case a
  when 'RequestFriendship'
    self.feedRequestFriendship(feed)
  when 'Friendship'
    self.feedNewFriendship(feed)
  else
    "You gave me #{a} -- I have no idea what to do with that."
  end
end


# private_class_method :feedRequestFriendship
# private_class_method :feedNewFriendship

end
