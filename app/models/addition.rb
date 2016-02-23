class Addition < ActiveRecord::Base
  belongs_to :discount
  belongs_to :profile
  belongs_to :story
end
