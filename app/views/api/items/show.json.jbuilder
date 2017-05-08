json.item do
  json.set! :id, @item.id
  json.set! :name, @item.name
  json.set! :description, @item.description
  json.set! :detail, @item.detail
  json.set! :price do
    json.set! :currency, @item.currency.name
    json.set! :retail_price, @item.retail_price
    json.set! :hire_price, @item.hire_price
  end
  json.set! :units do
    json.array!(@units) do |key, value|
      json.set! :size, key
      json.set! :unit, value.map{|v| {id: v[:id], length: v[:length]}}
    end
  end
end
