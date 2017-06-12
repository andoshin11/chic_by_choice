class Api::FavoriteListsController < Api::AbstractController
  def show
    @favorite_list = current_favorite_list
  end
end
