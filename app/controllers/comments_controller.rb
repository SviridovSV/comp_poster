class CommentsController < ApplicationController
  before_filter :authenticated_user_only
  before_filter :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params

    if @comment.save
      flash[:success] = "Comment created"
    else
      flash[:warning] = "Your comment wasn't posted!"
    end
      redirect_to posters_path
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Poster.find_by_id(params[:poster_id]) if params[:poster_id]
  end
end