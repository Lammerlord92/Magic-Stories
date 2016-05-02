class Comment < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  #validates :rating, :inclusion => 1..10
  #validates :author, presence: true

  belongs_to :profile
  belongs_to :story
end
