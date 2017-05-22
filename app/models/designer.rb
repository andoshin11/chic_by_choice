class Designer < ApplicationRecord
  has_many :items, inverse_of: :item

  validates :name, presence: true
end
