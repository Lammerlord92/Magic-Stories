class Chapter < ActiveRecord::Base
  belongs_to :story
  validates :title, presence: true
  validates :body, presence: true
end
