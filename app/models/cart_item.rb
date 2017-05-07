class CartItem < ApplicationRecord
  belongs_to :cart , inverse_of: :cart_items, optional: true

  validates :name, presence: true, allow_blank: false
  validates :price, presence: true
  validates :cart_id, presence: true
  validates :unit_id, presence: true
  validates :currency_id, presence: true
  validates :num_units, presence: true
end
