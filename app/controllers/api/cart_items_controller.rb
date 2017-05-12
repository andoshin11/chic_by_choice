class Api::CartItemsController < Api::AbstractController
  def create
    puts "testing"
    puts params
    CartItem.create(cart_id: current_cart.id, unit_id: params[:unitId].to_i, currency_id: 1, name: params[:name], price: params[:price].to_f, num_units: params[:numUnits].to_i)
    render json: { message: "Success!" }, status: 200
  rescue => e
    puts e
    render json: { error: 'Something went wrong' }, status: 422
  end
end
