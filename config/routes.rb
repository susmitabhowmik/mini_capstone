Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#delete"

    get "/suppliers" => "suppliers#index"
    get "/suppliers/:id" => "suppliers#show"

    post "/users" => "users#create"

    post "/sessions" => "sessions#create"
  end
end
