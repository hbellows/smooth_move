# frozen_string_literal: true

class LocationsController < ApplicationController

  def show
    @city = CityInformation.new(params[:id])
  end
end