class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  def index
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end

  def create
    #subtotal = quantity * price
    product = Product.find(params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    tax_rate = 0.08
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax

    current_user.carted_products.where(status: "carted")
      @order = Order.new({
        user_id: current_user.id,
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total:calculated_total
      })
      end
      
      render 'show.json.jbuilder'
      end
