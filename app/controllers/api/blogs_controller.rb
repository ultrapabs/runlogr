class Api::BlogsController < ApplicationController

  def index
    @blogs = Blog.includes(:author)
    render :index
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
    @blog = Blog.includes(:author).find(params[:id])
    render :show
  end

  def update
    @blog = current_user.blogs.find(params[:id])

    if !@blog.nil? && @blog.update!(blog_params)
      render json: @blog
    else
      render json: @blog.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :preview)
  end
end
