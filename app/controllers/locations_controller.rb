# frozen_string_literal: true

class LocationsController < ApplicationController
  helper_method :city
  
  def show
    city
  end

  private

  def city
    @city = CityInformation.new(params[:id])
  end
end