Rails.application.routes.draw do
  get 'fragments/random', to: 'fragments#random'
  resources :fragments
  root 'welcome#index'
end
