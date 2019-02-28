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

  def inventory
    @item = []
    @product = params[:name]
    Product.all.each do |product|
      if @product == product.name
        @item << product
      end
    end
      render 'inventory.json.jbuilder'
  end
end
