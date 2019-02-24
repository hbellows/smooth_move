class SearchController < ApplicationController

  def index
    @city = CityFinder.new(params[:q])
  end
end