class Profile < ActiveRecord::Base
  belongs_to :user

  validates :avatar, :signature, :description, :name, :profile_status, presence: true, on: :update
  validates :avatar, :signature,                                       uniqueness: true, on: :update

  has_many :stories

end
