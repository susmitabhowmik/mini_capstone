class Api::OrdersController < ApplicationController
  def create
    @order = Order.new({
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: Product.find(params[:product_id]).price,
      tax: Product.find(params[:product_id]).price*0.08,
      total:(Product.find(params[:product_id]).price) + Product.find(params[:product_id]).price*0.08
    })
    @order.save
    render 'show.json.jbuilder'
  end
end
