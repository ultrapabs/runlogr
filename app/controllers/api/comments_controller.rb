class Api::CommentsController < ApplicationController


  def create
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
