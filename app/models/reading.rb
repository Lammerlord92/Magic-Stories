class Reading < ActiveRecord::Base
  belongs_to :creatorProfile, class_name: "Profile", foreign_key: "profile_id"
  belongs_to :story,  class_name: "Story"

  validates :creatorProfile, uniqueness: {scope: :story}
end
