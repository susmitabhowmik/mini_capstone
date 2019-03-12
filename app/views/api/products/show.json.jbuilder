json.partial!"product.json.jbuilder", product: @product
json.is_discounted? @product.is_discounted?
json.tax @product.tax
json.total_price @product.total
json.images @product.images