class UsersController < ApplicationController
  
  # before_action controller: :cards, action: :delete, only: [:destroy]
  
  def show
    @user = User.find(params[:id])
    @username = current_user.username
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end
  
  def destroy
    @user = User.find(params[:id]) #特定のidを持つ情報を取得
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to :root #削除に成功すればrootページに戻る
   
    card = Card.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
  end
  
  def plancheck
  end
  
  private
  def user_params
    params.require(:user).permit(:image, :username, :email, :text, :sex, :area, :birthday, :age)
  end
end
