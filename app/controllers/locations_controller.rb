# frozen_string_literal: true

class LocationsController < ApplicationController
  
  def show
    city
  end

  private

  def city
    @city = CityInformation.new(params[:id])
  end
end