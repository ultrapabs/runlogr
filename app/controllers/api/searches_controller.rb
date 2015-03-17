class Api::SearchesController < ApplicationController

  def index
    @search_results = User.search_by_username_or_desc(params[:query])
    render :index
  end
end
