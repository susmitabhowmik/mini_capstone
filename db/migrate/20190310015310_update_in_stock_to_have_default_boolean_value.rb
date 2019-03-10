class UpdateInStockToHaveDefaultBooleanValue < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :in_stock?, :in_stock
    change_column :products, :in_stock, :boolean
    Product.all.each do |product|
      product.update_attributes!(:in_stock => true)
    end
  end
end
