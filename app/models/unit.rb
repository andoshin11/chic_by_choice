class Unit < ApplicationRecord

  validates :name, presence: true
  validates :price, presence: true
end
