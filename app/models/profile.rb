class Profile < ActiveRecord::Base
  belongs_to :user

  validates :avatar, :signature, :description, :name, :profile_status, presence: true
  validates :avatar, :signature,                                       uniqueness: true

  has_many :stories

end
