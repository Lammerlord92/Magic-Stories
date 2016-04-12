class Donation < ActiveRecord::Base
  validates :amount, numericality: {more_than_or_equal_to: 1.0}
  has_one :payment, as: :good
end
