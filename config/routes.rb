Rails.application.routes.draw do

  get 'sessions/create'

  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'

  post '/user/ban/:id', to: 'users#ban', as: :ban
  post '/user/unban/:id', to: 'users#unban', as: :unban

  root 'welcome#index'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
