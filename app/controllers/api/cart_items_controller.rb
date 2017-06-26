class Api::CartItemsController < Api::AbstractController
  def create
    primary_unit = params[:primaryUnit]
    secondary_unit = params[:secondaryUnit]

    current_cart.cart_items.destroy_all

    unit_hash = {
      price: params[:price].to_f,
      period: params[:period],
      event_date: params[:eventDate],
      delivery_date: params[:deliveryDate],
      return_date: params[:returnDate],
      currency_id: params[:currencyId],
      cart_id: current_cart.id,
      designer_name: params[:designerName],
      item_name: params[:itemName],
    }

    primary_hash = unit_hash.merge(priority: 0, unit_id: primary_unit[:id], size: primary_unit[:size], length: primary_unit[:length])
    CartItem.create(primary_hash)

    if secondary_unit.present?
      secondary_hash = unit_hash.merge(priority: 1, unit_id: secondary_unit[:id], size: secondary_unit[:size], length: secondary_unit[:length])
      CartItem.create(secondary_hash)
    end

    render json: { message: "Success!" }, status: 200
  rescue => e
    puts e
    render json: { error: 'Something went wrong' }, status: 422
  end


  def destroy
    current_cart.cart_items.destroy_all

    render json: { message: "Success!" }, status: 200
  rescue => e
    puts e
    render json: { error: 'Something went wrong' }, status: 422
  end
end
