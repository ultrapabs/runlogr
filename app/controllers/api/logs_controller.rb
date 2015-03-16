class Api::LogsController < ApplicationController

  def index
    @logs = Log.includes(:user)
    render :index
  end

  def create
    @log = current_user.logs.new(log_params)
    @log.title = "untitled" if @log.title == ""

    if @log.save
      render json: @log
    else
      render json: @log.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @log = Log.includes({:user => :shoes}, :shoe).find(params[:id])
    if (@log.user_id == current_user.id)
      @shoes = current_user.shoes
    end

    render :show
  end

  def update
    @log = current_user.logs.find(params[:id])

    if !@log.nil? && @log.update!(log_params)
      render json: @log
    else
      render json: @log.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def log_params
    params.require(:log).permit(:title, :date, :distance, :duration, :notes, :shoe_id)
  end
end
