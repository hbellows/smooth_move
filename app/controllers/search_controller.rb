# frozen_string_literal: true

class SearchController < ApplicationController

  def index
    city_search
  end

  private

  def city_search
    @city_search = CityFinder.new(params[:q])
  end
end