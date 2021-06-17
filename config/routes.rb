Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  root to: "items#index"
    resources :items do
    resources :item, only:[:new]
#   resources :orders, only: [:create, :index]
#   resources :comments, only: :create
#  end

#   resources :credit_cards, only: [:show] do
#    collection do
#    post 'pay', to: 'credit_cards#pay'
#    end
#  end
  end
end
