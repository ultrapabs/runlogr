class Api::LogsController < ApplicationController

  def index
    @logs = current_user.followed_logs.includes(:user)
    render :index
  end

  def create
    @log = current_user.logs.new(log_params)
    @log.title = "untitled" if @log.title =~ /^\s*$/

    if @log.save
      render json: @log
    else
      render json: @log.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @log = Log.includes({:user => :shoes}, :shoe).find(params[:id])
    @comments = @log.comments.includes(:author)
    if (@log.user_id == current_user.id)
      @shoes = current_user.shoes
    end

    render :show
  end

  def update
    @log = current_user.logs.find(params[:id])
    @log.shoe_id = nil unless is_users_shoe?(@log)

    if !@log.nil? && @log.update!(log_params)
      render :show
    else
      render json: @log.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @log = current_user.logs.find(params[:id])
    @log.destroy! unless @log.nil?
    render :show
  end

  private
  def log_params
    params.require(:log).permit(:title, :date, :distance, :duration, :notes, :shoe_id)
  end

  def is_users_shoe?(log)
    shoes = current_user.shoes.select('id').to_a
    id_arr = []
    shoes.each do |shoe|
      id_arr << shoe.id
    end

    id_arr.include?(log.shoe_id)
  end
end
