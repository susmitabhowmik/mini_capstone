class Api::OrdersController < ApplicationController
  def index
    @orders = user.orders
    render 'index.json.jbuilder'
  end

  def create
    #subtotal = quantity * price
    product = Product.find(params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    tax_rate = 0.08
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax


    @order = Order.new({
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total:calculated_total
    })
    @order.save!
    render 'show.json.jbuilder'
  end
end
