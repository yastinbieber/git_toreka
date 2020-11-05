class Workoutstock < ApplicationRecord
	belongs_to :workoutdiary
	belongs_to :user
end
