class Item < ApplicationRecord
  belongs_to :currency, inverse_of: :items, optional: true
  belongs_to :designer, inverse_of: :items
  has_many :units, inverse_of: :item

  validates :name, presence: true
end
