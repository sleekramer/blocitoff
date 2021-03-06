Rails.application.routes.draw do



  authenticated :user do
    root 'users#show', as: :authenticated
  end
  resources :users, only: [] do
    resources :items, only: [:create, :destroy]

  end
  resources :items, only: [] do
    resources :subitems, only: [:create]
    post 'subitems/:id/mark_complete' => 'subitems#mark_complete', as: :mark_complete
    post 'subitems/:id/mark_incomplete' => 'subitems#mark_incomplete', as: :mark_incomplete
  end
  devise_for :users
  root to: 'welcome#about'

  namespace :api, defaults: { format: :json } do
    devise_for :users, controllers: {sessions: "users/sessions"}
    resources :users, only: [:index, :show] do
      resources :items, only: [:create, :destroy, :update]
    end
    resources :items, only: [] do
      resources :subitems, only: [:create, :update]
      patch 'subitems/:id/mark_complete' => 'subitems#mark_complete'
      patch 'subitems/:id/mark_incomplete' => 'subitems#mark_incomplete'
    end
  end

end
