class DashboardsController < ApplicationController
  
	def index
		# weightchanges
		@search_params = weightchange_search_params
		if current_user.idealweight.present?
      @weightchanges = current_user.weightchanges.where(date: current_user.idealweight.start_day..current_user.idealweight.last_day).includes(:user).order(date: "ASC")
      @weightchange_today = current_user.weightchanges.find_by(date: Date.current.all_day)
      weightchanges = @weightchanges.pluck(:date, :todayweight, :expected_weight)
      @labels = weightchanges.map(&:first)
      @datas = weightchanges.map(&:second)
      @idealweight_datas = weightchanges.map(&:third)
      @max = current_user.weightchanges.maximum(:todayweight)
      @minimum = current_user.weightchanges.minimum(:todayweight)
      @weight_last = current_user.weightchanges.last
      # fooddiaries
      @fooddiaries = current_user.fooddiaries.search(params[:search]).includes(:user)
      @fooddiary_sum_kcal = @fooddiaries.sum { |fooddiary| fooddiary[:kcal] }
      @fooddiary_sum_protein = @fooddiaries.sum { |fooddiary| fooddiary[:protein] }
      @fooddiary_sum_fat = @fooddiaries.sum { |fooddiary| fooddiary[:fat] }
      @fooddiary_sum_carbo = @fooddiaries.sum { |fooddiary| fooddiary[:carbo] }
      @fooddiary_today = current_user.fooddiaries.find_by(date: Date.current.all_day)
      # advicediary
      # @advicediaries_today = current_user.advicediaries.find_by(date: Date.current.all_day)
    end
    
	end
	
	private
	def weightchange_search_params
    params.fetch(:search, {}).permit(:date_from, :date_to)
  end
end
