class GoalCommentsController < ApplicationController
  def create
    @comment = GoalComment.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to goal_url(@comment.goal_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to goal_url(@comment.goal_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :goal_id)
  end
end
