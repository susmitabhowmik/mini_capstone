class Api::ProductsController < ApplicationController
  def index
    search_term = params[:search]
    products_lower_than = params[:price].to_i
    if search_term
      @products = Product.where("name iLIKE ?", "%#{search_term}%")
    else
      @products = Product.all
    end

    if params[:discount] == "true"
      @products = @products.where("price < ? ", 100)
    end

    if params[:sort] && params[:order]
      # If there is params sort at all make that the key in the search
      @products = @products.order(params[:sort] => params[:order])
    end

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
      description: params[:description],
      in_stock: params[:in_stock]
      })
    if @product.save
      render 'show.json.jbuilder'
    else
      render 'error.json.jbuilder', status: :unprocessible_entry
    end
  end

  def update
    #find the product I want to update
    @product = Product.find(params[:id])
    #update the product I want to update
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.in_stock = params[:in_stock] || @product.in_stock
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
