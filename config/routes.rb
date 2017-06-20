Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cell_phones do
    member do
      post 'upvote'
      post 'downvote'
    end
  end
  resources :reviews

  root to: 'cell_phones#index'
end
