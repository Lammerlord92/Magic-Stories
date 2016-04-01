class DiscountUserGroup < ActiveRecord::Base

  validates :user_group_id, :discount_id, presence: true

  belongs_to :user_group
  belongs_to :discount

end
