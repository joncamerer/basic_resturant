Rails.application.routes.draw do
  devise_for :members
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'loyalty', to: 'pages#loyalty'
  get 'menu', to: 'pages#menu'
  get 'location', to: 'pages#location' 
end
