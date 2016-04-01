class UserGroup < ActiveRecord::Base

  validates :name, :code, presence: true
  validates :code, uniqueness: true

  has_many :users
  has_many :discount_user_groups
  has_many :discounts, :through => :discount_user_groups
  has_many :actor_user_groups
  has_many :users, :through => :actor_user_groups

end
