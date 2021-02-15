json.array! @products do |product|
    json.extract! product, :id, :name, :description, :category, :price, :features, :sku, :quantity
  end