Rails.application.routes.draw do
  resources :dashboard, only: :index
  root 'employees#index'

  get 'dashboard/index' => "dashboard#index"
  get "dashboard/new"=>"dashboard#new"
  post "dashboard/create" => "dashboard#create"

  get "dashboard/sort/:sort" => "dashboard#sort"
  get "dashboard/:id" => "dashboard#show"



  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :employees do
    resources :profiles
  end
end
