class CompletionsController < ApplicationController

  def create
    todo.mark_complete!
  end


  private

  def todo
    current_user.todos.find(params[:todo_id])
  end
end
