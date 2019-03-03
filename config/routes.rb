Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
  end
end
