Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    resources :item_lines
    resources :shopping_carts
    post '/shopping_cart_payeds', to:'shopping_cart_payeds#paymant', as: :paymant
    resources :clasifications
    resources :credit_cards do
      get 'user/:user_id', to: 'credit_cards#from_user', on: :collection, as: :from_user
    end
    resources :products do
      get 'user/:user_id', to: 'products#from_manager', on: :collection, as: :from_manager
      get 'catalog', to: 'products#catalog', on: :collection, as: :catalog
    end
    root 'home#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
