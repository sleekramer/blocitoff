class SubitemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @subitem = @item.subitems.new(subitem_params)

    if @subitem.save
      @new_subitem = @item.subitems.new
      flash[:notice] = "Subitem for #{@item.name} created."
    else
      flash[:error] = "There was an error creating subitem."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def mark_complete
    @subitem = Subitem.find(params[:id])
    if @subitem.update_attribute(:completed, true)
      @item_completed = reveal_delete_item_button?(@subitem.item)
      flash[:notice] = "#{@subitem.name} completed"
    else
      flash[:error] = "There was an error. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def mark_incomplete
    @subitem = Subitem.find(params[:id])
    if @subitem.update_attribute(:completed, false)
      flash[:notice] = "#{@subitem.name} marked incomplete."
    else
      flash[:error] = "There was an error. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def subitem_params
    params.require(:subitem).permit(:name)
  end

  def reveal_delete_item_button?(item)
    item.subitems.all?{|s| s.completed == true}
  end
end
