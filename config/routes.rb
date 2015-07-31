Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:update]
  
  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts, only: [] do #only create /post/:post_id/comments routes not /posts/:id routes
    resources :comments, only: [:create, :destroy]
  end
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
