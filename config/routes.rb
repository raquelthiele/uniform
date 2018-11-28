Rails.application.routes.draw do
  get 'requerimentos/new'

  root 'static_pages#home'
  get  '/cadastro',  to: 'usuario#new'
  resources :usuarios
  resources :requerimentos
end