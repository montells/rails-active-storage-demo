Rails.application.routes.draw do
  root to: 'posts#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
