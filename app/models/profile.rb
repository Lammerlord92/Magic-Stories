class Profile < ActiveRecord::Base
  belongs_to :user
# t  has_many :friendships, through: :user
  validates :profile_status, inclusion: {in: ["PUBLIC", "PRIVATE"]}
  validates :avatar, :signature, :description, :name, :profile_status, presence: true, on: :update, unless: :skip_update_validation
  validates  :signature,                                       uniqueness: true, on: :update, unless: :skip_update_validation

  attr_accessor :skip_update_validation

  has_many :stories
  has_many :comments
  has_many :additions

# Permite que un perfil pueda seguir a otros y que pueda ser seguido:

  acts_as_follower
  acts_as_followable


  before_create {
    self.profile_status = "PUBLIC"
  }

=begin t
  # FIXME Este método parecido al de Friendship.are_friends?. (Este aparentemente no contempla si la petición ha sido aceptada).
  def isFriend(profile1)
    !Friendship.where({user_id: self.user.id, friend_id: profile1.user.id}).first.blank?
  end

=end

end
