class PurchasesController < ApplicationController
	require 'payjp'
	
	def index
	end
	
  #	有料プラン利用規約
	def termsofservice
	end

  # def basicplan
  #   card = Card.where(user_id: current_user.id).first
  #   #テーブルからpayjpの顧客IDを検索
  #   if card.blank?
  #     #登録された情報がない場合にカード登録画面に移動
  #     redirect_to controller: "cards", action: "new"
  #   else
  #     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #     #保管した顧客IDでpayjpから情報取得
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
  #     @default_card_information = customer.cards.retrieve(card.card_id)
  #   end
  # end
  
  # ベーシックプランへ登録
  # def pay
  #   card = Card.where(user_id: current_user.id).first
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   subscription = Payjp::Subscription.create(
  #   :customer => card.customer_id, 
  #   :plan => 'pln_c97be8359fee9eecf65b59eeed35',
  #   metadata: {user_id: current_user.id}
  #   )
  #   current_user.update(subscription_id: subscription.id, plan: subscription.plan.id, plan_id: subscription.plan.id, status: subscription.status, trial_end: subscription.trial_end)
  #   redirect_to action: 'done'
  # end

  # キャンセル（共通）
  def cancel
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    subscription = Payjp::Subscription.retrieve(current_user.subscription_id)
    subscription.cancel
    current_user.update(plan: 'free', plan_id: subscription.plan.id, status: subscription.status)
    redirect_to action: 'canceled'
  end
  
  # 再開(共通)
  def resume
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    subscription = Payjp::Subscription.retrieve(current_user.subscription_id)
    subscription.resume
    current_user.update(plan: subscription.plan.id, plan_id: subscription.plan.id, status: subscription.status)
    redirect_to action: 'done'
  end
  
  # # basic=>premium upgrade
  # def update
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   subscription = Payjp::Subscription.retrieve(current_user.subscription_id)
  #   subscription.trial_end = current_user.trial_end
  #   subscription.plan = 'pln_572790307dd04b525bdd0a155347'
  #   subscription.prorate = true
  #   subscription.save
  #   current_user.update(plan: subscription.plan.id, plan_id: subscription.plan.id, status: subscription.status)
  #   redirect_to action: 'done'
  # end
  
  # def update_upgrade
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   subscription = Payjp::Subscription.retrieve(current_user.subscription_id)
  #   subscription.resume #再開
  #   subscription.trial_end = current_user.trial_end
  #   subscription.plan = 'pln_572790307dd04b525bdd0a155347'
  #   subscription.prorate = true
  #   subscription.save #upgrade
  #   current_user.update(plan: subscription.plan.id, plan_id: subscription.plan.id, status: subscription.status)
  #   redirect_to action: 'done'
  # end
  
  # # premium=>basic down
  # def downdate
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   subscription = Payjp::Subscription.retrieve(current_user.subscription_id)
  #   subscription.trial_end = current_user.trial_end
  #   subscription.plan = 'pln_c97be8359fee9eecf65b59eeed35'
  #   subscription.prorate = true
  #   subscription.save
  #   current_user.update(plan: subscription.plan.id, plan_id: subscription.plan.id, status: subscription.status)
  #   redirect_to action: 'done'
  # end
  
  # def downdate_downgrade
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   subscription = Payjp::Subscription.retrieve(current_user.subscription_id)
  #   subscription.resume #再開
  #   subscription.trial_end = current_user.trial_end
  #   subscription.plan = 'pln_c97be8359fee9eecf65b59eeed35'
  #   subscription.prorate = true
  #   subscription.save
  #   current_user.update(plan: subscription.plan.id, plan_id: subscription.plan.id, status: subscription.status)
  #   redirect_to action: 'done'
  # end
  
  # プレミアムプランへ登録
  def premiumplan
    card = Card.where(user_id: current_user.id).first
    #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  
  def premium_pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    subscription = Payjp::Subscription.create(
    :customer => card.customer_id, 
    :plan => 'pln_572790307dd04b525bdd0a155347',
    metadata: {user_id: current_user.id}
    )
    current_user.update(subscription_id: subscription.id, plan: subscription.plan.id, plan_id: subscription.plan.id, status: subscription.status, trial_end: subscription.trial_end)
    redirect_to action: 'done'
  end
  
  def delete #プランを削除（ユーザーアカウント作成時のみ実行）
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    subscription = Payjp::Subscription.retrieve(current_user.subscription_id)
    subscription.delete
    # current_user.update(plan: 'free')
  end
  

end
