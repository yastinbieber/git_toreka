class FooddatesController < ApplicationController
	def new
		@fooddate = Fooddate.new
	end
	
	def create
		@fooddate = Fooddate.create(foodname: fooddate_params[:foodname], inputgram: fooddate_params[:inputgram], gram: fooddate_params[:gram], kcal: fooddate_params[:kcal], protein: fooddate_params[:protein], fat: fooddate_params[:fat], carbo: fooddate_params[:carbo])
		redirect_to controller: :fooddiaries, action: :new
	end
	
	private
	def fooddate_params
		params.require(:fooddate).permit(:foodname, :gram, :inputgram, :kcal, :protein, :fat, :carbo)
	end
end
