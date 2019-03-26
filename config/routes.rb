Rails.application.routes.draw do
  root 'posts#top'
  get 'posts/selfhelp'
  get 'posts/introduction'
  get 'posts/top'

  get 'inquiry' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resource :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :recipes, only: [:create, :destroy]
  resources :materials, only: [:create, :destroy]
  resources :users do
    # resources :favorites do
    #   post "add", to: "favorite#create"
    #end
    get 'information', to:'users#information'
    get 'favorite', to:'users#favorite'
  end

  get 'search', to: 'posts#search', as: :search



end