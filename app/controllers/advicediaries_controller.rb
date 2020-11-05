class AdvicediariesController < ApplicationController
  
  autocomplete :advicemenu, :menu, full: true
  
  def index
    if current_user.plan != 'pln_572790307dd04b525bdd0a155347'
      redirect_to controller: :dashboards, action: :index
 	  else
      @search_params = advicediary_search_params
      @advicediaries = Advicediary.search(@search_params).includes(:advicemenu)
      @advicemenus = Advicemenu.all
    end
  end
  
  def choice
    if current_user.plan != 'pln_572790307dd04b525bdd0a155347'
      redirect_to controller: :dashboards, action: :index
 	  else
      @advicemenus = Advicemenu.all
      # ダイエット
      @advicemenu_a = Advicemenu.where(group: "A\r")
      @advicemenu_b = Advicemenu.where(group: "B\r")
      @advicemenu_c = Advicemenu.where(group: "C\r")
      @advicemenu_d = Advicemenu.where(group: "D\r")
      @advicemenu_e = Advicemenu.where(group: "E\r")
      @advicemenu_f = Advicemenu.where(group: "F\r")
      @advicemenu_g = Advicemenu.where(group: "G\r")
      @advicemenu_h = Advicemenu.where(group: "H\r")
      @advicemenu_i = Advicemenu.where(group: "I\r")
      @advicemenu_j = Advicemenu.where(group: "J\r")
      @advicemenu_k = Advicemenu.where(group: "K\r")
      @advicemenu_l = Advicemenu.where(group: "L\r")
      @advicemenu_m = Advicemenu.where(group: "M\r")
      @advicemenu_n = Advicemenu.where(group: "N\r")
      @advicemenu_o = Advicemenu.where(group: "O\r")
      # バルクアップ
      @advicemenu_p = Advicemenu.where(group: "P\r")
      @advicemenu_q = Advicemenu.where(group: "Q\r")
      @advicemenu_r = Advicemenu.where(group: "R\r")
      @advicemenu_s = Advicemenu.where(group: "S\r")
      @advicemenu_t = Advicemenu.where(group: "T\r")
      @advicemenu_u = Advicemenu.where(group: "U\r")
      @advicemenu_v = Advicemenu.where(group: "V\r")
      @advicemenu_w = Advicemenu.where(group: "W\r")
      @advicemenu_x = Advicemenu.where(group: "X\r")
      @advicemenu_y = Advicemenu.where(group: "Y\r")
      @advicemenu_z = Advicemenu.where(group: "Z\r")
      @advicemenu_aa = Advicemenu.where(group: "AA\r")
      @advicemenu_ab = Advicemenu.where(group: "AB\r")
      @advicemenu_ac = Advicemenu.where(group: "AC\r")
      @advicemenu_ad = Advicemenu.where(group: "AD\r")
      #美尻
      @advicemenu_ae = Advicemenu.where(group: "AE\r")
      @advicemenu_af = Advicemenu.where(group: "AF\r")
      @advicemenu_ag = Advicemenu.where(group: "AG\r")
      @advicemenu_ah = Advicemenu.where(group: "AH\r")
      @advicemenu_ai = Advicemenu.where(group: "AI\r")
      @advicemenu_aj = Advicemenu.where(group: "AJ\r")
      #美女
      @advicemenu_ak = Advicemenu.where(group: "AK\r")
      @advicemenu_al = Advicemenu.where(group: "AL\r")
      @advicemenu_am = Advicemenu.where(group: "AM\r")
      @advicemenu_an = Advicemenu.where(group: "AN\r")
      @advicemenu_ao = Advicemenu.where(group: "AO\r")
      @advicemenu_ap = Advicemenu.where(group: "AP\r")
      @advicemenu_aq = Advicemenu.where(group: "AQ\r")
      @advicemenu_ar = Advicemenu.where(group: "AR\r")
      @advicemenu_as = Advicemenu.where(group: "AS\r")
      @advicemenu_at = Advicemenu.where(group: "AT\r")
    end
  end
  
  def new
    if current_user.plan != 'pln_572790307dd04b525bdd0a155347'
      redirect_to controller: :dashboards, action: :index
 	  else
      @form = Form::AdvicediaryCollection.new
      params[:group]
      @advicemenus = Advicemenu.where(group: params[:group])
    end
  end
  
  def create
    @form = Form::AdvicediaryCollection.new(advicediary_collection_params)
    # binding.pry
    if @form.save
      redirect_to advicediaries_path
    else
      redirect_to choice_advicediaries_path
    end
  end
  
  def show
    @advicediary = Advicediary.find(params[:id])
  end
  
  def content
  end
  
  def destroy
    Advicediary.find(params[:id]).destroy
    @advicediaries = Advicediary.all
    redirect_to action: 'index'
  end
  
  def edit
    @advicediary = Advicediary.find(params[:id])
    params[:group]
    @advicemenus = Advicemenu.where(group: params[:group])
  end
  
  def update
    @advicediary = Advicediary.find(params[:id])
    @advicediary.update(advicediary_params)
    redirect_to action: 'index'
  end
  
  private
  def advicediary_params
    params.require(:advicediary).permit(:date, :weight, :reps, :weightsecond, :repssecond, :weightthird, :repsthird, :memo, :menu, :created_at, :user_id, :idealweight_id, :useradvice_id)
  end
  
  def advicediary_collection_params
    params
      .require(:form_advicediary_collection)
      .permit(advicediaries_attributes: Form::Advicediary::REGISTRABLE_ATTRIBUTES)
  end
  
  def advicediary_search_params
    params.fetch(:search, {}).permit(:menu, :date_from, :date_to, :advicemenu_id)
  end
  
end
