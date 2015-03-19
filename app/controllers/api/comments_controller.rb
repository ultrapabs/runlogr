class Api::CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      render :new
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
