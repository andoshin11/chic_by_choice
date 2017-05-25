class Api::ItemsController < Api::AbstractController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all.includes(:images)
  end

  def show
    @units = @item.units.group_by{|i| i.size}
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

end
