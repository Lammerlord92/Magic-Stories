
class Administrator < ActiveRecord::Base

  has_many :users, as: :role

end