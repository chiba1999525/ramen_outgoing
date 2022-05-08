Rails.application.routes.draw do
 
 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
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
    resources :users, only: [:index, :snow]
    resources :items
    resources :genres, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  end
  
  
  namespace :user do
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
