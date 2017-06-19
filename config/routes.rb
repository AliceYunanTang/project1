Rails.application.routes.draw do


  root to: 'projects#index'

  resources :users
  resources :projects
  resources :time_entries

  get    '/login' => 'session#new'
  post   '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
