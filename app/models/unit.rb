class Unit < ApplicationRecord
  belongs_to :item, inverse_of: :units
  validates :size, presence: true
  validates :length, presence: true
end
