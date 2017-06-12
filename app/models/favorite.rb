class Favorite < ApplicationRecord
  belongs_to :favorite_list , inverse_of: :favorites
  belongs_to :unit , inverse_of: :cart_items, optional: true

  validates :favorite_list_id, presence: true
  validates :unit_id, presence: true
end
