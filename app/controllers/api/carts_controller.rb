class Api::CartsController < Api::AbstractController
  def show
    @cart = current_cart
    @cart_items = @cart.cart_items.group_by{|i| i.unit.item}
  end
end
