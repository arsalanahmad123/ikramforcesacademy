Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index'
  get '/about', to: 'home#about'
  get '/gallery',to: 'home#gallery'
  get '/contact',to: 'home#contact'

  resources :papers do
    resources :questions
  end

  get '/papers/:id/start_paper', to: 'papers#start_paper', as: 'start_paper'
  post '/papers/:id/start_paper', to: 'papers#submit_paper', as: 'submit_paper'
  get '/papers/:id/result_paper', to: 'papers#result_paper', as: 'result_paper'
  
  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#unblock', as: 'unblock_user'
end
