class Report < ActiveRecord::Base
  belongs_to :user_id
  validates :title, :body, :status, :type, presence: true
end
