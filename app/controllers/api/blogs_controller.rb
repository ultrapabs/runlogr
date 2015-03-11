class Api::BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    render json: @blogs
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    @blog.author_id = current_user.id
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
    params.require(:blog).permit(:title, :body, :preview)
  end

end
