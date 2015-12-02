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

end
