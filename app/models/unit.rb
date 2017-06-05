class Unit < ApplicationRecord
  belongs_to :item, inverse_of: :units
  has_many :cart_items, inverse_of: :item
  validates :size, presence: true
  validates :length, presence: true
end
