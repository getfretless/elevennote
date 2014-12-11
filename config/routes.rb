Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root 'welcome#index'
  resources :users, only: [:create, :update]
  resources :notes, except: :edit
  get 'sign_up' => 'users#new',  as: :sign_up
  get 'profile' => 'users#edit', as: :profile
  resources :sessions, only: :create
  delete 'logout' => 'sessions#destroy', as: :logout
  get    'login'  => 'sessions#new',     as: :login


  # /api/v1/notes.json
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :notes
    end
  end
  match '/api/*path' => 'api/api#preflight', via: [:options]

end
