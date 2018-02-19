Rails.application.routes.draw do
  #resources generates the entire lists of routes[7 paths - index, new, create, show, edit, delete. You can point a resource to a different controller name using 'controller'
  #nested resources allows relationship based routes to be created. i.e. 1 user has 1 password. 1 user has multiple listings.

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  root 'home#index'

  #'as' gives a name to the route URL <i.e. clearance/sessions#new>
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
