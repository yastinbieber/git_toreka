class WeightchangesController < ApplicationController
  
	def index
	  @search_params = weightchange_search_params
    @weightchanges = current_user.weightchanges.search(@search_params).order(date: "ASC")
    @weightchange_today = current_user.weightchanges.find_by(date: Date.current.all_day)
    weightchanges = @weightchanges.pluck(:date, :todayweight, :expected_weight)
    @labels = weightchanges.map(&:first)
    @datas = weightchanges.map(&:second)
    @idealweight_datas = weightchanges.map(&:third)
    @max = current_user.weightchanges.maximum(:todayweight)
    @minimum = current_user.weightchanges.minimum(:todayweight)
    @weight_last = current_user.weightchanges.last
    @weightchangess = current_user.weightchanges.all
  end
  
  def confirm
    if current_user.idealweight.blank?
      redirect_to action: :index
    end
    @weightchange_today = current_user.weightchanges.find_by(date: Date.current.all_day)
    if @weightchange_today.present?
      redirect_to action: :index
    end
  end
  
  def new
    unless current_user.weightchanges.where(date: Date.current).present?
      @weightchange = Weightchange.new
    else
      redirect_to action: :index
    end
  end
  
  def create
    @weightchange = Weightchange.create(date: weightchange_params[:date], todayweight: weightchange_params[:todayweight], expected_weight: weightchange_params[:expected_weight], user_id: current_user.id, idealweight_id: current_user.idealweight.id)
    redirect_to action: :index
  end
  
  def destroy
    current_user.weightchanges.find(params[:id]).destroy
    @weightchanges = current_user.weightchanges.all
    redirect_to action: 'index'
  end
  
  def edit
    @weightchange = current_user.weightchanges.find(params[:id])
  end
  
  def update
    @weightchange = current_user.weightchanges.find(params[:id])
    @weightchange.update(weightchange_params)
    redirect_to action: 'index'
  end
  
  private
  def weightchange_params
    params.require(:weightchange).permit(:date, :todayweight, :expected_weight, :user_id, :idealweight_id)
  end
  
  def weightchange_search_params
    params.fetch(:search, {}).permit(:date_from, :date_to)
  end
end
