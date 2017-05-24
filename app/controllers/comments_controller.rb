class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @link, notice: 'Comment was successfully created'
    else
      render :new
    end
  end

  private def comment_params
    params.require(:comment).permit(:link_id, :body, :user_id)
  end

end
