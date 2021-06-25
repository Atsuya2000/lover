Rails.application.routes.draw do
  get 'chats/show'
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
  end

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
