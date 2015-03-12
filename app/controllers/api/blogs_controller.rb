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
    @blog = Blog.find(params[:id])
    render json: @blog
  end

  def update
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :preview)
  end
end
