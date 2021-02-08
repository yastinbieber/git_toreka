class FooddatesController < ApplicationController
	def new
		@fooddate = Fooddate.new
	end
	
	def create
		@fooddate = Fooddate.create(foodname: fooddate_params[:foodname], gram: fooddate_params[:gram], unit: fooddate_params[:unit], kcal: fooddate_params[:kcal], protein: fooddate_params[:protein], fat: fooddate_params[:fat], carbo: fooddate_params[:carbo])
		redirect_to controller: :fooddiaries, action: :new
	end
	
	private
	def fooddate_params
		params.require(:fooddate).permit(:foodname, :gram, :unit, :kcal, :protein, :fat, :carbo)
	end
end
