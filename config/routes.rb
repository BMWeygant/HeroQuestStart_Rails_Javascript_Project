Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users do
    resources :heros, only: [:index]
  end
  resources :heros, except: [:index]
  resources :adventures
  resources :experiences
  #post '/experiences', to: 'experiences#create'
end
