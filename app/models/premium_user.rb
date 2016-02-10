class PremiumUser < ActiveRecord::Base
  has_one :user, as: :sku
end
