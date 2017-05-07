class Item < ApplicationRecord
  belongs_to :currency, inverse_of: :items, optional: true
end
