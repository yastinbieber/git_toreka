class WorkoutdiariesController < ApplicationController
  
  before_action :move_to_index, except: :index
  autocomplete :workoutdate, :menu, full: true

  def index
    @search_params = workoutdiary_search_params
    @workoutdiaries = current_user.workoutdiaries.search(@search_params).includes(:workoutdate)
  end
  
  def confirm
  end
	
	def new
    @workoutdiary = current_user.workoutdiaries.new
  end
  
  def create
    @workoutdiary = current_user.workoutdiaries.create(workoutdiary_params)
    # binding.pry
    redirect_to action: 'index'
  end
  
  def show
    @workoutdiary = current_user.workoutdiaries.find(params[:id])
  end
  
  def destroy
    current_user.workoutdiaries.find(params[:id]).destroy
    @workoutdiaries = current_user.workoutdiaries.all
    redirect_to action: 'index'
  end
  
  def edit
    @workoutdiary = current_user.workoutdiaries.find(params[:id])
  end
  
  def update
    @workoutdiary = current_user.workoutdiaries.find(params[:id])
    @workoutdiary.update(workoutdiary_params)
    redirect_to action: 'index'
  end
  
  private
  def workoutdiary_params
    params.require(:workoutdiary).permit(:date, :settype, :weight, :reps, :weightsecond, :repssecond, :weightthird, :repsthird, :memo, :menu, :created_at, :user_id, :workoutdate_id)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
  def workoutdiary_search_params
    params.fetch(:search, {}).permit(:menu, :date_from, :date_to, :workoutdate_id)
  end
 
end
