class Api::FollowsController < ApplicationController

  def create
    @follow = Follow.new(leader_id: params[:leader_id],
      follower_id: current_user.id
    )

    if @follow.save
      render json: @follow
    else
      render json: @follow.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @follow = current_user.follows_follows.find(params[:id])

    @follow.destroy! unless @follow.nil?
    render json: @follow
  end

end
