class IdealweightsController < ApplicationController
  
  def confirm
  end
  
 	def new
 	  if current_user.plan == 'free'
 	    redirect_to controller: :dashboards, action: :index
 	  else
   	  idealweight = Idealweight.where(user_id: current_user.id).first
   	  if idealweight.blank?
        @idealweight = Idealweight.new
      else
        redirect_to controller: :dashboards, action: :index
      end
    end
  end
  
  def create
    idealweight = Idealweight.where(user_id: current_user.id).first
    if idealweight.blank?
      @idealweight = Idealweight.create(idealweight_params)
      if current_user.plan == 'free'
        TargetMailer.input_information(@idealweight).deliver_now
        redirect_to controller: :advicediaries, action: :content # basicプランの場合
      elsif current_user.plan == 'pln_572790307dd04b525bdd0a155347'
        redirect_to controller: :useradvices, action: :new # premiumプランの場合
      end
    else
      redirect_to controller: :idealweights, action: :warning
    end
  end
  
  def show
    @idealweight = Idealweight.find(params[:id])
  end
  
  def edit
    @idealweight = Idealweight.find(params[:id])
  end
  
  def update
    @idealweight = Idealweight.find(params[:id])
    @idealweight.update(idealweight_params)
    TargetMailer.edit_information(@idealweight).deliver_now
    redirect_to action: 'show'
  end
  
  def destroy
    Idealweight.find(params[:id]).destroy
    @idealweights = Idealweight.all
    redirect_to controller: :fooddiaries, action: :index
  end
  
  def warning
  end
  
  private
  def idealweight_params
    params.require(:idealweight).permit(:height, :weight, :targetweight, :exerciselevel, :period, :basemetabolism, :kcalburned, :minusweight, :minuskcal, :kcalintake, :intakeproteingram, :intakeproteinkcal, :intakefatgram, :intakefatkcal, :intakecarbogram, :intakecarbokcal, :start_day, :last_day, :user_id)
  end
end
