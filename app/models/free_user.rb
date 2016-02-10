class FreeUser < ActiveRecord::Base
  has_one :user, as: :sku
end
