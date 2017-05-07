class Cart < ApplicationRecord
  # belongs_to :user, inverse_of: :cart, optional: true
  has_many :cart_items, inverse_of: :cart, dependent: :destroy
end
