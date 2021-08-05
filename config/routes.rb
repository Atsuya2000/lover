Rails.application.routes.draw do
  get 'chats/show'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
  }
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
  end

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

end
