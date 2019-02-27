# frozen_string_literal: true

class CityFinder
  include DataUsaClientHelper

  attr_reader :city

  def initialize(city)
    @city = city
  end

  def find_city_matches
    cities_data.keep_if do |data|
      data[5] == "160"
    end
  end

  def city_matches
    find_city_matches.map do |data|
      City.new(data)
    end
  end
end