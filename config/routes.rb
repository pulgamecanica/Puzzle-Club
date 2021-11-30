Rails.application.routes.draw do
  devise_for :admins
  root to: "home#index"
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
end
