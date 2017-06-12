class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def current_cart
    # sessionはハッシュのようにアクセスできる
    begin
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      # 新しいカートを作成する(DBも書き込む)
      cart = Cart.create(user_id: 1)
      session[:cart_id] = cart.id
      cart
    end
  end

  def current_favorite_list
    begin
      FavoriteList.find(session[:favorite_list_id])
    rescue ActiveRecord::RecordNotFound
      cart = FavoriteList.create(user_id: 1)
      session[:favorite_list_id] = cart.id
      cart
    end
  end
end
