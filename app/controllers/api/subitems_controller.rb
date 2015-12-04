class Api::SubitemsController < ApiController
  before_action :authenticated?

  def create
    item = Item.find(params[:item_id])
    subitem = item.subitems.new(subitem_params)
    if subitem.save
      render json: subitem
    else
      render json: { errors: subitem.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def subitem_params
    params.require(:subitem).permit(:name)
  end
end
