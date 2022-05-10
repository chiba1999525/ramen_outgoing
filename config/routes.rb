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
  
  
  namespace :admin do
    resources :customers, only: [:index, :snow, :destroy]
    resources :items, only: [:index, :show, :destroy]   
    resources :genres, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  end
  
  namespace :user do
    resources :genres, only: [:show]
    resources :items, only: [:index, :show, :edit, :update, :destroy, :new, :create] do
        resource :comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
    end 
    resources :customers, only: [:index, :show, :edit, :update, :destroy ] do
      collection do
        get 'mypage' => 'customers#mypage'
       end
    end
  end

  
end
