class UserGroup < ActiveRecord::Base

  validates :name, :code, :discount_user_group_id, :actor_user_group_id, presence: true
  validates :code, uniqueness: true

  has_many :discount_user_groups
  has_many :discounts, :through => :discount_user_groups
  has_many :actor_user_groups
  has_many :actor, :through => :actor_user_groups

end
