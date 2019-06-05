Rails.application.routes.draw do
  devise_for :users, :paths => 'users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resource :user do
    resources :heros, only: [:index, :new, :create]
  end
  resources :heros
  resources :adventures
  post '/experiences', to: 'experiences#create'
end
