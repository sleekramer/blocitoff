class ItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)
    if @item.save
      flash[:notice] = "Item added."
    else
      flash[:error] = "Item creation failed."
    end
    redirect_to root_path(@user)
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
