class Api::CartsController < Api::AbstractController
  def show
    @cart = current_cart
  end
end
