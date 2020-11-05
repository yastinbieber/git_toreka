class WorkoutdatesController < ApplicationController
	def new
		@workoutdate = Workoutdate.new
	end
	
	def create
		@workoutdate = Workoutdate.create(workoutdate_params)
		redirect_to controller: :workoutdiaries, action: :index
	end
	
	private
	def workoutdate_params
		params.require(:workoutdate).permit(:menu, :part)
	end
end
