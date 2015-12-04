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

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
