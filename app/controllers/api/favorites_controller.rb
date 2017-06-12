class Api::FavoritesController < Api::AbstractController
  def create
    item_id = params[:itemId]
    raise if Favorite.where(favorite_list_id: current_favorite_list).find_by(item_id: item_id).present?

    Favorite.create(favorite_list_id: current_favorite_list.id, item_id: item_id);

    render json: { message: "Success!" }, status: 200
  rescue => e
    puts e
    render json: { error: 'Something went wrong' }, status: 422
  end
end
