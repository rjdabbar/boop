ScorecardTest::Application.routes.draw do

  get "contestant/show"
  get "contestant/index"
  get "contestant/edit"
  get "contestant/new"
  get "contestant/destroy"
  get "event/index"
  get "event/show"
  get "event/create"
  get "event/destroy"
  get "event/new"
  get "event/edit"
  devise_for :users
  root "home#index"
  resources :event
  resources :contestant
end
