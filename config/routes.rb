Rails.application.routes.draw do
  root to: "mainpages#index"
  
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  
  resources :users, only: [:show, :edit, :update, :destroy] do
    collection do
      get 'plancheck'
      get 'planchange'
      get 'basicplan'
      get 'premiumplan'
    end
  end
  
  resources :workoutdiaries do
    collection do
      get 'confirm'
    end
    get :autocomplete_workoutdate_menu, :on => :collection
  end
  
  resources :workoutdates, only: [:new, :create]
  
  resources :idealweights, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'warning'
    end
  end
  
  resources :fooddates, only: [:new, :create]
  
  resources :fooddiaries do
    collection do
      get 'confirm'
    end
    get :autocomplete_fooddate_foodname, :on => :collection
  end
  
  resources :useradvices, only: [:new, :create, :show, :edit, :update, :destroy]
  
  resources :advicediaries, only: [:index, :new, :create, :edit, :update, :destroy, :show] do
    collection do
      get 'choice'
      get 'content'
      get 'confirm'
    end
    get :autocomplete_advicemenu_menu, :on => :collection
  end
  
  resources :advicemenus do
    collection do
      get 'introduction'
    end
  end
  
  resources :howtovideos, only: [:index]
  
  resources :weightchanges, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'confirm'
    end
  end
  
  resources :dashboards, only: [:index]
  
  resources :mainpages, only: [:index] do
    collection do
      get 'plan_comparison'
      get 'freeplan'
      get 'basicplan'
      get 'premiumplan'
      get 'termsofservice'
      get 'personalinformation'
    end
  end
  
  resources :cards, only: [:new, :show, :edit] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
      post 'pay_add', to: 'cards#pay_add'
    end
  end
  
  resources :purchases, only: [:index] do
    collection do
      get 'index', to: 'purchases#index'
      get 'basicplan', to: 'purchases#basicplan'
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
      post 'cancel', to: 'purchases#cancel'
      get 'canceled', to: 'purchases#canceled'
      post 'resume', to: 'purchases#resume'
      get 'premiumplan', to: 'purchases#premiumplan'
      post 'premium_pay', to: 'purchases#premium_pay'
      post 'update', to: 'purchases#update'
      post 'downdate', to: 'purchases#downdate'
      post 'update_upgrade', to: 'purchases#update_upgrade'
      post 'downdate_downgrade', to: 'purchases#downdate_downgrade'
      get 'termsofservice', to: 'purchases#termsofservice'
      post 'delete', to: 'purchases#delete'
    end
  end
  
  resources :dashboards, only: [:index]
  
  resources :settings, only: [:index]
  
  resources :withdrawals, only: [:new, :create]
    get  'inquiry' => 'inquiry#index'              # 入力画面
    post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
    post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
  end

