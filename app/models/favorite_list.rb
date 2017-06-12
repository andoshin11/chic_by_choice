class FavoriteList < ApplicationRecord
  has_many :favorites, inverse_of: :favorite_list, dependent: :destroy
end
