class FreeUser < ActiveRecord::Base
  has_many :users, as: :role
end
