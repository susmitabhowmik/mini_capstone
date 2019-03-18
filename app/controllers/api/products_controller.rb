class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  # everyone
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

    if params[:sort] && params[:sort_order]
      # If there is params sort at all make that the key in the search
      @products = @products.order(params[:sort] => params[:sort_order])
    end

    if params[:category]
      #find category
      category = Category.find_by(name: params[:category])
      #find all products in that category
      @products = category.products
    end

    render 'index.json.jbuilder'
  end

  #everyone

  def show
    p 'current_user'
    p current_user
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  #only admin

  def create
    @product = Product.new({
      name: params[:name],
      price: params[:price],
      description: params[:description],
      in_stock: params[:in_stock],
      supplier_id: params[:supplier_id]
      })
    if @product.save
      render 'show.json.jbuilder'
    else
      render 'error.json.jbuilder', status: :unprocessible_entry
    end
  end

  #only admin

  def update
    #find the product I want to update
    @product = Product.find(params[:id])
    #update the product I want to update
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.in_stock = params[:in_stock] || @product.in_stock
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    if @product.save
      render 'show.json.jbuilder'
    else
      render 'error.json.jbuilder', status: :unprocessible_entry
    end
  end

  #only admin

  def delete
    #find the product I want to destroy
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    #destroy the product I want to destroy
    @product.destroy
    render 'destroy.json.jbuilder'
  end
end
