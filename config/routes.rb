Rails.application.routes.draw do
  resources :fragments
  root 'welcome#index'
end
