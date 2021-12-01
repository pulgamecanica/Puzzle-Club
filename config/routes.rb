Rails.application.routes.draw do
  devise_for :admins
  scope module: 'admins' do
    get 'admin_home'
    get 'notifications'
    resources :puzzles
    resources :memories
    resources :tournaments
    resources :text_memories
    resources :image_memories
    resources :puzzle_contenders, only: [:new, :create, :destroy] do
      resources :votes
    end
  end
  scope module: 'visitors' do
    root to: "home#index"
    get 'visitors/puzzles/index' => 'puzzles#index', as: 'visitors_puzzles'
    get '/visitors/puzzles/:id' => 'puzzles#show', as: 'visitors_puzzle' 
  end
end
