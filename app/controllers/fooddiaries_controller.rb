class FooddiariesController < ApplicationController
  autocomplete :fooddate, :foodname, full: true
	
	def index
	  @fooddiaries = current_user.fooddiaries.search(params[:search])
	  @fooddiary_morning = @fooddiaries.where(timing: '朝食')
    @fooddiary_lunch = @fooddiaries.where(timing: '昼食')
    @fooddiary_dinner = @fooddiaries.where(timing: '夕食')
    @fooddiary_snack = @fooddiaries.where(timing: '間食')
    @fooddiary_sum_kcal = @fooddiaries.sum { |fooddiary| fooddiary[:kcal] }
    @fooddiary_sum_protein = @fooddiaries.sum { |fooddiary| fooddiary[:protein] }
    @fooddiary_sum_fat = @fooddiaries.sum { |fooddiary| fooddiary[:fat] }
    @fooddiary_sum_carbo = @fooddiaries.sum { |fooddiary| fooddiary[:carbo] }
    @fooddiary_today = current_user.fooddiaries.find_by(created_at: Date.current.all_day)
  end
  
  def new
    @fooddiary = current_user.fooddiaries.new
    if params[:fooddate] && params[:fooddate][:foodname]
    fooddate_foodname = params[:fooddate][:foodname]
    @fooddates = Fooddate.where(foodname: fooddate_foodname)
    else
    @fooddates = Fooddate.all
    end
  end
  
  def create
    @fooddiary = Fooddiary.create(fooddiary_params)
    redirect_to action: 'index'
  end
  
  def destroy
    current_user.fooddiaries.find(params[:id]).destroy
    @fooddiaries = current_user.fooddiaries.all
    redirect_to action: 'index'
  end
  
  def edit
    @fooddiary = current_user.fooddiaries.find(params[:id])
  end
  
  def update
    @fooddiary = current_user.fooddiaries.find(params[:id])
    @fooddiary.update(fooddiary_params)
    redirect_to action: 'index'
  end
  
  private
  def fooddiary_params
    params.require(:fooddiary).permit(:gram, :kcal, :protein, :fat, :carbo, :timing, :date, :fooddate_id, :user_id, :idealweight_id)
  end
end
