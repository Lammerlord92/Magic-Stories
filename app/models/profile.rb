class Profile < ActiveRecord::Base
  belongs_to :user

  validates :name, :avatar, :description, :signature, presence: true
  validates :avatar, :signature, uniqueness: true
  validates :profile_status, presence: true

end
