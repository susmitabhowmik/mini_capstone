class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  def index
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end

  def create
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

    calculated_subtotal = 0
    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    tax_rate = 0.08
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
    user_id: current_user.id,
    subtotal: calculated_subtotal,
    tax: calculated_tax,
    total: calculated_total )
    @order.save

    # @carted_products.each do |carted_product|
    #   carted_product.order_id = @order.id
    #   carted_product.status = 'purchased'
    #   carted_product.save
    # end

    #alternate syntax for above
    carted_product.update_all(order_id: @order.id, status: 'purchased')
    render 'show.json.jbuilder'
  end

end
