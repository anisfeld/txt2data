Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "projects#index"

  resources :projects
  resources :descriptions
  resources :users

  get "/sessions/new" => 'sessions#new'
  post "/sessions" => 'sessions#create'
  get "/logout" => 'sessions#destroy'


  resources :projects do
    resources :data
  end
  # get "/projects/:id/data/" => "data#index"
  # get "/projects/:id/data/" => 'data#new'
  post "/projects/:id/data/import" => 'data#import' #import csv
  # post "/projects/:id/data" => 'data#create'
  # get "/projects/:id/data/:data_id" => 'data#show'
  # delete "/projects/:id/data/:data_id" => 'data#destroy'
  # get "/projects/:id/data/:data_id/edit" => 'data#edit'
  # patch "/projects/:id/data/:data_id" => 'data#update'

end
