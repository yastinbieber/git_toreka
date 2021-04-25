class UseradvicesController < ApplicationController
  
# 	def new
# 	  if current_user.plan == 'free'
# 	    redirect_to controller: :dashboards, action: :index
# 	  else
#   	  useradvice = Useradvice.where(user_id: current_user.id).first
#       if useradvice.blank?
#         @useradvice = Useradvice.new
#       else
#         redirect_to controller: :dashboards, action: :index
#       end
#     end
#   end
  
  def new
    if current_user.plan == 'pln_572790307dd04b525bdd0a155347' || current_user.demo == 'torekadekawaro'
      useradvice = Useradvice.where(user_id: current_user.id).first
      if useradvice.blank?
        @useradvice = Useradvice.new
      else
        redirect_to controller: :dashboards, action: :index
      end
    else
      redirect_to controller: :dashboards, action: :index
    end
  end
  
  def create
    useradvice = Useradvice.where(user_id: current_user.id).first
    if useradvice.blank?
      @useradvice = Useradvice.create(useradvice_params)
      PurposeMailer.input_information(@useradvice).deliver_now
      redirect_to  controller: :advicediaries, action: :content
    else
      redirect_to controller: :idealweights, action: :warning
    end
  end
  
  def show
    @useradvices = Useradvice.find(params[:id])
  end
  
  def edit
    @useradvice = Useradvice.find(params[:id])
  end
  
  def update
    @useradvice = Useradvice.find(params[:id])
    @useradvice.update(useradvice_params)
    PurposeMailer.edit_information(@useradvice).deliver_now
    redirect_to action: 'show'
  end
  
  def destroy
    Useradvice.find(params[:id]).destroy
    @useradvices = Useradvice.all
    redirect_to controller: :users, action: :show
  end
  
  private
  def useradvice_params
    params.require(:useradvice).permit(:purpose, :frequency, :user_id, :idealweight_id)
  end
end
