json.extract! unit_image, :id, :unit_id, :url, :name, :created_at, :updated_at
json.url unit_image_url(unit_image, format: :json)
