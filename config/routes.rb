Rails.application.routes.draw do
  resources :products
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    resources :shopping_carts
    root 'home#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
