class AddProductIdToCartedProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :carted_products, :product_id, :integer
  end
end
