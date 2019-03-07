json.partial!"product.json.jbuilder", product: @product
json.discounted? @product.is_discounted?
json.tax @product.tax
json.total_price @product.total