Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    get "/hairspray" => "products#hairspray"
    get "/pen" => "products#pen"
    get "/products" => "products#inventory"
    get "/products/:name" => "products#inventory"
  end
end
