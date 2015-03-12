class Api::LogsController < ApplicationController

  def index
    @logs = Log.all
    render json: @logs
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
    @log = Log.find(params[:id])
    render json: @log
  end

  def update
  end

  def destroy
  end

  private
  def log_params
    params.require(:log).permit(:title, :date, :distance, :duration, :notes, :shoe_id)
  end
end
