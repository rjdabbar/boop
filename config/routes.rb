ScorecardTest::Application.routes.draw do


  devise_for :users
  root "home#index"
  resources :event
  resources :contestant
end
