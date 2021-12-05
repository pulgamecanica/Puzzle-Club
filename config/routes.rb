Rails.application.routes.draw do
  devise_for :admins
  scope module: 'admins' do
    get 'admin_home'
    get 'notifications'
    resources :puzzles
    resources :memories
    resources :tournaments
    resources :contributors, only: [:new, :create, :destroy, :edit, :update, :index]
    resources :text_memories
    resources :image_memories
    resources :puzzle_contenders, only: [:new, :create, :destroy] do
      resources :votes
    end
  end
  scope module: 'visitors' do
    root to: "home#index"
    post 'votes', to: 'home#votes'
    get '/home/current_puzzle' => 'home#current_puzzle', as: 'current_puzzle'
    get '/home/puzzle/:id' => 'puzzles#show', as: 'visitors_puzzle' 
    get '/home/puzzles/index' => 'puzzles#index', as: 'visitors_puzzles'
    get '/home/tournaments'  => 'home#tournaments', as: 'visitor_torunaments'
  end
end
