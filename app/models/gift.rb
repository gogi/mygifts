class Gift < ActiveRecord::Base
  has_many :ideas
  has_many :users, through: :ideas
end
