Rails.application.routes.draw do
  get 'usuario/new'

  root 'static_pages#home'
  
end