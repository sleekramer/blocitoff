class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(current_user.id)
    @items = @user.items.where.not(id: nil)
  end
end
