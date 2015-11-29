class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :gift

  acts_as_taggable
  acts_as_taggable_on :recipient
end
