class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :friendships, through: :user
  validates :profile_status, inclusion: {in: ["PUBLIC", "PRIVATED"]}
  validates :avatar, :signature, :description, :name, :profile_status, presence: true, on: :update
  validates :avatar, :signature,                                       uniqueness: true, on: :update

  has_many :stories

  before_create {
    self.profile_status = "PUBLIC"
  }

end
