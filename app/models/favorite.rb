class Favorite < ApplicationRecord
  belongs_to :favorite_list , inverse_of: :favorites
  belongs_to :item, inverse_of: :favorites

  validates :favorite_list_id, presence: true
  validates :item_id, presence: true
end
