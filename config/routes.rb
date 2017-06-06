Rails.application.routes.draw do
  get 'fragments/random', to: 'fragments#random'
  resources :fragments
  resources :arrangements
  root 'welcome#index'

end
