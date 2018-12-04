Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/cadastro',  to: 'usuarios#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :usuarios
  resources :requerimentos, only: [:index, :new, :create, :edit, :update]
end