class Discount < ActiveRecord::Base

  validates :code, :title, :description, presence: true
  validates :code, uniqueness: true
  validates :description, :length => {maximum:100}
  validates :amount, :inclusion => 1..10

  has_many :discount_user_groups
  has_many :user_groups, :through => :discount_user_groups

end
