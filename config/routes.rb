Rails.application.routes.draw do
  resources :welcome, only: [:index]
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
