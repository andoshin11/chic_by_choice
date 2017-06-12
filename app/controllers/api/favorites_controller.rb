class Api::FavoritesController < Api::AbstractController
  def create
    item_id = params[:itemId]

    puts item_id

    render json: { message: "Success!" }, status: 200
  rescue => e
    puts e
    render json: { error: 'Something went wrong' }, status: 422
  end
end
