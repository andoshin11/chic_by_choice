class CartItem < ApplicationRecord
  belongs_to :cart , inverse_of: :cart_items, optional: true

  validates :price, presence: true
  validates :cart_id, presence: true
  validates :unit_id, presence: true
  validates :currency_id, presence: true
  validates :priority, presence: true
end
