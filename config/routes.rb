Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/cadastro',  to: 'usuario#new'
end