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
    resources :genres, only: [:show]
    resources :items, only: [:index, :show, :edit, :update, :destroy, :new, :create] do
      collection do 
        get "search" => "items#search"
      end   
        resources :comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
    end 
    resources :customers, only: [:index, :show, :edit, :update, :destroy ] do
       member do
         get :comments
         get :favorites
       end
      collection do
        get '/confirm' =>  'customers#confirm'
        get 'mypage' => 'customers#mypage'
        patch '/withdraw_processing' =>  'customers#withdraw_processing'
       end
    end
  end

  
end
