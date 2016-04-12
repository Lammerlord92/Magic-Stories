class HasCategory < ActiveRecord::Base
  belongs_to :story
  belongs_to :category
end
