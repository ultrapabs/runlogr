class Api::ShoesController < ApplicationController

  def index
    render json: current_user.shoes
  end

  def create
    @shoe = current_user.shoes.new(shoe_params)

    if @shoe.save
      render json: @shoe
    else
      render json: @shoe.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @shoe = current_user.shoes.find(params[:id])
    @shoe.destroy!
    render "api/users/index"
  end

  private
  def shoe_params
    params.require(:shoe).permit(:name, :distance)
  end

end
