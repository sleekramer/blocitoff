Rails.application.routes.draw do

  authenticated :user do
    root 'users#show', as: :authenticated
  end

  devise_for :users
  root to: 'welcome#about'

end
