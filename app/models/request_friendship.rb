class RequestFriendship < ActiveRecord::Base
  has_one :sender, class_name: "User"
  has_one :recipient, class_name: "User"
  has_one :friendship

  validates :sender, :message, :status, presence: true
  validates :friendship, allow_nil: true
  validates :status, :inclusion => { :in => ["PENDING", "REJECTED", "ACCEPTED"] }
end
