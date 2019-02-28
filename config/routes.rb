Rails.application.routes.draw do
  namespace :api do
    get "/all_products" => "products#all_products"
    get "/hairspray" => "products#hairspray"
    get "/pen" => "products#pen"
    get "/products" => "products#inventory"
  end
end
