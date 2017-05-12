json.cart do
  json.set! :id, @cart.id
  json.set! :items do
    json.array!(@cart.cart_items) do |cart_item|
      json.(
        cart_item,
        :id, :unit_id, :name, :price, :num_units
      )
    end
  end
end
