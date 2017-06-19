Rails.application.routes.draw do
  devise_for :members, controllers: { registrations: 'members/registrations',
  passwords: 'members/passwords' }
  root to: 'pages#home'
  resources :members do
    resource :account
  end
  get 'about', to: 'pages#about'
  get 'loyalty', to: 'pages#loyalty'
  resources 'menu'
  get 'location', to: 'pages#location' 
end
