class RequestFriendship < ActiveRecord::Base
  has_one :sender, class_name: "User", :foreign_key => "sender_id"
  has_one :recipient, class_name: "User", :foreign_key => "recipient_id"
  has_one :friendship

  validates :message, :status, presence: true
  validates :status, :inclusion => { :in => ["PENDING", "REJECTED", "ACCEPTED"] }
end
