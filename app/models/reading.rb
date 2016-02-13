class Reading < ActiveRecord::Base
  belongs_to :readerProfile, class_name: "Profile", foreign_key: "profile_id"
  belongs_to :story,  class_name: "Story"

  validates :readerProfile, uniqueness: {scope: :story}
end
