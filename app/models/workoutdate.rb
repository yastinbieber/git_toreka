class Workoutdate < ApplicationRecord
  
  has_many :workoutdiaries
  validates :menu, presence: true
  # has_many :advicediaries
end
