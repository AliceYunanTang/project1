Rails.application.routes.draw do

  get 'time_entries/index'

  get 'time_entries/show'

  get 'time_entries/new'

  get 'time_entries/create'

  get 'time_entries/edit'

  get 'time_entries/update'

  get 'time_entries/destroy'

  root to: 'projects#index'

  resources :users
  resources :projects

  get    '/login' => 'session#new'
  post   '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
