json.item do
  json.set! :id, @item.id
  json.set! :name, @item.name
  json.set! :price do
    json.set! :currency, @item.currency.name
    json.set! :retail_price, @item.retail_price
    json.set! :hire_price, @item.hire_price
  end
end
