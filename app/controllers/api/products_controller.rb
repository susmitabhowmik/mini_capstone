class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jbuilder'
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new({
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_image_url],
      description: params[:input_description],
      })
    @product.save
    render 'show.json.jbuilder'
  end

  def update
    #find the product I want to update
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    #update the movie I want to update
    @product.name = params[:input_name] || @product.name
    @product.price = params[:input_price] || @product.price
    @product.image_url = params[:input_image_url] || @product.image_url
    @product.description = params[:input_description] || @product.input_description
    @product.save
    render 'show.json.jbuilder'
  end
end
