class Item < ApplicationRecord
  belongs_to :currency, inverse_of: :items, optional: true
  has_many :units, inverse_of: :item
end
