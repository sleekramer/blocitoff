class ItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)

    if @item.save
      @new_item = @user.items.new
      flash[:notice] = "Item added."
    else
      flash[:error] = "Item creation failed."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "#{@item.name} completed"
    else
      flash[:error] = "There was an error marking the item as complete. Please try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def mark_complete
    @item = item
    @item.mark_complete!
    flash[:notice] = "Item completed"
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item
    current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
