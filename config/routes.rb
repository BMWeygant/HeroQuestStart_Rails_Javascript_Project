Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :heros do
    resources :adventures
  end
  resources :experiences
  #post '/experiences', to: 'experiences#create'
end
