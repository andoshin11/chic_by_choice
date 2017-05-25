json.items do
  json.array!(@items) do |item|
    json.(
      item,
      :id, :name, :hire_price, :retail_price
    )
    json.designer do
      json.set! :id, item.designer.id
      json.set! :name, item.designer.name
    end
    json.images do
      json.array!(item.images) do |image|
        json.(
          image,
          :id, :url, :category
        )
      end
    end
  end
end
