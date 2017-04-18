class Api::ItemsController < Api::AbstractController
  before_action :set_item, only: [:show]

  def show
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

end
