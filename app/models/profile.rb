class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :friendships, through: :user
  validates :profile_status, inclusion: {in: ["PUBLIC", "PRIVATE"]}
  validates :avatar, :signature, :description, :name, :profile_status, presence: true, on: :update
  validates  :signature,                                       uniqueness: true, on: :update

  has_many :stories

  before_create {
    self.profile_status = "PUBLIC"
  }

  # FIXME Este método parecido al de Friendship.are_friends?. (Este aparentemente no contempla si la petición ha sido aceptada).
  def isFriend(profile1)
    !Friendship.where({user_id: self.user.id, friend_id: profile1.user.id}).first.blank?
  end

end
