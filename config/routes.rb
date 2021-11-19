Rails.application.routes.draw do
  devise_for :admins
  #get 'home/index'
  root to: "home#index"
  scope module: 'admins' do
    resources :puzzles
    resources :memories
    resources :image_memories
    resources :text_memories
  end
end
