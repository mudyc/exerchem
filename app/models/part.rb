class Part < ActiveRecord::Base
  belongs_to :course
  has_many :exercises
end