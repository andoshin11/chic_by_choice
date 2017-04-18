class Currency < ApplicationRecord

  has_many :items, inverse_of: :currency

  validates :name, presence: true
  validates :iso_code, presence: true
end
