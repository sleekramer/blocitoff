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

  def update
    subitem = Subitem.find(params[:id])
    if subitem.update(subitem_params)
      render json: subitem
    else
      render json: {errors: subitem.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def mark_complete
    subitem = Subitem.find(params[:id])
    if subitem.update_attribute(:completed, true)
      render json: subitem, serializer: SubitemSerializer
    else
      render json: { error: "Subitem not updated, alter request"}, status: 400
    end
  end

  def mark_incomplete
    subitem = Subitem.find(params[:id])
    if subitem.update_attribute(:completed, false)
      render json: subitem, serializer: SubitemSerializer
    else
      render json: { error: "Subitem not updated, alter request"}, status: 400
    end
  end

  private
  def subitem_params
    params.require(:subitem).permit(:name, :completed)
  end
end
