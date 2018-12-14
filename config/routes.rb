Rails.application.routes.draw do
  resources :users, :groups, :sessions, :attendance
  delete 'logout' => 'sessions#destroy'
  get 'main' => 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
