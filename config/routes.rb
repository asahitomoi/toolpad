Rails.application.routes.draw do
  root 'posts#top'
  get 'posts/selfhelp'
  get 'posts/introduction'
  get 'posts/top'
  get 'posts/index'
  get 'posts/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :recipes
  resources :materials
  resources :users do
    resource :favorites
    resource :comments
    get 'information', to:'users#information'
  end


end
