class CardsController < ApplicationController
	require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    # redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if current_user.cards.blank?
      if params['payjp-token'].blank?
        redirect_to action: "new"
      else
        customer = Payjp::Customer.create(
          description: 'クレカ登録',
          email: current_user.email,
          card: params['payjp-token'],
          metadata: {user_id: current_user.id}
          )
        @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
        if @card.save
          redirect_to action: "show"
        else
          redirect_to action: "pay"
        end
      end
    else #カードがすでに登録されていたら追加した後古いカードを削除する
      card = Card.where(user_id: current_user.id).first
      customer = Payjp::Customer.retrieve(card.customer_id)
      cards = customer.cards.create(
        card: params['payjp-token'],
        default: true #ココで登録したカードをデフォルトカードに指定する
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: cards.id)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
      @cards = customer.cards.retrieve(card.card_id)
      @cards.delete #dashboard上の1枚めのカードを削除する
      card.delete #1枚目のカードを削除する
    end
  end
  
  def edit
    card = Card.where(user_id: current_user.id)
    if card.blank?
      redirect_to action: "show"
    end
  end
  
  # def pay_add
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   card = Card.where(user_id: current_user.id).first
  #   customer = Payjp::Customer.retrieve(card.customer_id)
  #   @card = Card.update(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
  #   if @card.update
  #     redirect_to action: "show"
  #   else
  #     redirect_to action: "pay_add"
  #   end
  # end
  
  def pay_add
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.where(user_id: current_user.id).first
    customer = Payjp::Customer.retrieve(card.customer_id)
    @card = customer.cards.retrieve(card.card_id)
    current_user.cards.update(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    @card.save
    # cards.save
    redirect_to action: "show"
  end
  

  # def delete #PayjpとCardデータベースを削除します
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #   else
  #     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     customer.delete
  #     card.delete
  #   end
  #   redirect_to action: "new"
  #   if current_user.idealweight.present?
  #     idealweight = Idealweight.where(user_id: current_user.id).first
  #     idealweight.destroy
  #   end
  #   if current_user.useradvice.present?
  #     useradvice = Useradvice.where(user_id: current_user.id).first
  #     useradvice.destroy
  #   end
  #   # Freeプランに情報を戻す
  #   current_user.update(
  #     subscription_id: nil,
  #     plan: 'free',
  #     plan_id: nil,
  #     status: nil,
  #     trial_end: nil
  #     )
  # end
  
  def destroy #顧客を削除()
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.where(user_id: current_user.id).first
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
    redirect_to action: "new"
    # Freeプランにグレードダウン
    current_user.update(
      subscription_id: nil,
      plan: 'free',
      plan_id: nil,
      status: nil,
      trial_end: nil
      )
    # Freeプランなのでuseradviceは削除  
    if current_user.useradvice.present?
      useradvice = Useradvice.where(user_id: current_user.id).first
      useradvice.destroy
    end
  end
  
  # def delete #PayjpとCardデータベースを削除します
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #   else
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     customer.delete
  #     card.delete
  #   end
  #     redirect_to action: "new"
  # end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).last
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  
  #cardの削除
  def delete
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.where(user_id: current_user.id).first
    customer = Payjp::Customer.retrieve(card.customer_id)
    @card = customer.cards.retrieve(card.card_id)
    @card.delete
    # もし削除できたらDB側のカード情報も削除するんだ
    card.delete
    redirect_to action: "new"
  end
end
