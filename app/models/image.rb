class Image < ApplicationRecord
  belongs_to :item, inverse_of: :images
  self.inheritance_column = :_type_disabled

  validates :url, presence: true
  # validates :category, presence: true
end
