json.favoriteList do
  json.set! :id, @favorite_list.id
  json.items do
    json.array!(@favorite_list.favorites) do |favorite|
      json.(
        Item.find(favorite.item_id),
        :id, :name
      )
    end
  end
end
