class Donation < ActiveRecord::Base
  validates :amount, numericality: {more_than_or_equal_to: 1.0}, numericality: { only_integer: true }, numericality: {less_than_or_equal_to: 1000}
  has_one :payment, as: :good
end
