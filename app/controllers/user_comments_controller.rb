class UserCommentsController < ApplicationController
  def create
    @comment = UserComment.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to user_url(@comment.user_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to user_url(@comment.user_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
