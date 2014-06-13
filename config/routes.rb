ScorecardTest::Application.routes.draw do


  root "home#index"
  devise_for :users  
  resources :event
  resources :contestant
  resources :scorecard
  resources :user
end
