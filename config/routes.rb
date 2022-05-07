Rails.application.routes.draw do
 
  namespace :admin do
    get 'genres/index'
    get 'genres/new'
    get 'genres/show'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
    get 'genres/destroy'
  end
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
    resources :genr
  end
  
  
  namespace :user do
    resources :items, only: [:index, :show, :edit, :update, :destroy, :new, :create]
    resources :customers, only: [:index, :show, :edit, :update, :destroy] do
      collection do
        get 'mypage' => 'customers#mypage'
       end
    end
  end

  
end
