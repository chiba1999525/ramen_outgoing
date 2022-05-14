Rails.application.routes.draw do
 
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  root to: 'homes#top'
  get "about" => "homes#about"
  
  
  namespace :admin do
    resources :customers, only: [:index, :show, :destroy]
    resources :items, only: [:index, :show, :destroy] do
      collection do 
        get "search" => "items#search"
      end   
        resources :comments, only: [:create, :destroy]
    end 
    resources :genres, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  end
  
  
  
  namespace :user do
    resources :messages, only: [:create]
    resources :rooms, only: [:create, :index, :show]
    resources :genres, only: [:show]
    resources :items, only: [:index, :show, :edit, :update, :destroy, :new, :create] do
      collection do 
        get "search" => "items#search"
      end   
        resources :comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
        
    end 
    resources :messages, only: [:create]
    resources :rooms, only: [:create, :index, :show]
    resources :customers, only: [:index, :show, :edit, :update, :destroy ] do
       member do
         get :comments
         get :favorites
         get "room" => "customers#room"
       end
      collection do
        get 'mypage' => 'customers#mypage'
       end
    end
  end

  
end
