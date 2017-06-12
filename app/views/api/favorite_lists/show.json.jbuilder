json.favoriteList do
  json.set! :id, @favorite_list.id
  json.items do
    json.array!(@favorite_list.favorites) do |favorite|
      item = Item.find(favorite.item_id)
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
end
