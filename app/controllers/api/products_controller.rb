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
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
      })
    if @product.save
      render 'show.json.jbuilder'
    else
      render 'error.json.jbuilder', status: :unprocessible_entry
    end
  end

  def update
    #find the product I want to update
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    #update the movie I want to update
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.input_description
    if @product.save
      render 'show.json.jbuilder'
    else
      render 'error.json.jbuilder', status: :unprocessible_entry
    end
  end

  def delete
    #find the product I want to destroy
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    #destroy the product I want to destroy
    @product.destroy
    render 'destroy.json.jbuilder'
  end
end
