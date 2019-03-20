json.array! @carted_products.each do |carted_product|
  # if carted_product.status == "carted"
    json.user_id carted_product.user_id
    json.product_id carted_product.product_id
    json.quantity carted_product.quantity
    json.status carted_product.status
    json.order_id carted_product.order_id
  # end
end