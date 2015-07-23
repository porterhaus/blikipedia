class SearchController < ApplicationController
  def index
    if jump = find_jump_target
      redirect_to jump
    else
      session[:search_results] = request.url
      @results = Search.for(params[:keyword])
    end
  end

  private

  def find_jump_target
    Wiki.find_by(title: params[:keyword]) ||
      User.find_by(name: params[:keyword])
  end
end
