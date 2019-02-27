class Api::ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'all_products.json.jbuilder'
  end

  def hairspray
    @hairspray = Product.first
    render 'hairspray.json.jbuilder'
  end

  def pen
    @pen = Product.second
    render 'pen.json.jbuilder'
  end
end
