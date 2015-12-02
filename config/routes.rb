Rails.application.routes.draw do

  authenticated :user do
    root 'users#show', as: :authenticated
  end

  resources :users, only: [] do
    resources :items, only: [:create] do
      member do
        post :mark_complete
        post :mark_incomplete
      end
    end
  end

  devise_for :users
  root to: 'welcome#about'

end
