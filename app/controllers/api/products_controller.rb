class Api::ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'all_products.json.jbuilder'
  end
end
