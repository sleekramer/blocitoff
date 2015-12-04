class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    user = User.find(params[:user_id])
    item = user.items.new(item_params)
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: {errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      user = User.find(params[:user_id])
      item = user.items.find(params[:id])
      if can_be_deleted?(item)
        item.destroy
        render json: {message: "Item has been deleted"}.to_json, status: :ok
      else
        render json: {error: "This item cannot be deleted because it has incomplete subitems"}, status: 403
      end
    rescue ActiveRecord::RecordNotFound
      render json: {}.to_json, status: :not_found
    end

  end

  private
  def can_be_deleted?(item)
    item.subitems == [] || item.subitems.all?{|s| s.completed == true}
  end
  def item_params
    params.require(:item).permit(:name)
  end
end
