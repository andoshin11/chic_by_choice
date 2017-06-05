json.cart do
  json.set! :id, @cart.id
  json.items do
    json.array!(@cart_items) do |k, v|
      json.set! :id, k[:id]
      json.set! :name, k[:name]
      json.set! :designer, Designer.find(k[:designer_id]).name
      json.images do
        json.array!(Image.where(id: k[:id])) do |image|
          json.(
            image,
            :id, :url, :category
          )
        end
      end
      json.units do
        json.array!(v.sort_by{|i| i.priority}) do |cart_item|
          json.(
            cart_item,
            :id, :price, :currency_id, :unit_id, :size, :length, :priority, :period, :event_date, :delivery_date, :return_date
          )
        end
      end
    end
  end
end
