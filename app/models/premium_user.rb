class PremiumUser < ActiveRecord::Base
  has_many :users, as: :role
  validates :expiration, presence: true
end
