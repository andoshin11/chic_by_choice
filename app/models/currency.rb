class Currency < ApplicationRecord

  validates :name, presence: true
  validates :iso_code, presence: true
end
