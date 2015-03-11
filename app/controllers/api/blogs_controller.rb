class Api::BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    render json: @blogs
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save
      render json: @blog
    else
      render json: @blog.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
  end

  private
  def blog_params
    params.require(:blogs).permit(:title, :body, :preview)
  end

end
