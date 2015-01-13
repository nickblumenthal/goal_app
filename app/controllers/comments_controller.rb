class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to "/#{@comment.commentable_type.downcase}s/#{@comment.commentable_id}"
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to "/#{@comment.commentable_type.downcase}s/#{@comment.commentable_id}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end
end
