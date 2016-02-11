class Option < ActiveRecord::Base
  validates :option, presence: true
  validates_associated :chapters
end
