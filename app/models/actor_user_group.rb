class ActorUserGroup < ActiveRecord::Base

  validates :user_id, :usergroup_id, presence: true

  belongs_to :user
  belongs_to :user_group

end
