# frozen_string_literal: true

class CityInformation

  attr_reader :geo_id

  def initialize(geo_id)
    @geo_id = geo_id
  end

  def city_overview
    CityData.new(find_city_overview).data
  end

  def city_name
    city_overview[:display_name]
  end

  def city_stats
    CityData.new(find_city_stats).data
  end

  def population
    city_stats[:pop]
  end

  def average_age
    city_stats[:age]
  end

  def non_us_citizens
    (city_stats[:non_us_citizens] * 100).round
  end

  def mean_commute
    (city_stats[:mean_commute_minutes]).round
  end

  def average_income
    city_stats[:income].to_i
  end

  def owner_occupied
    (city_stats[:owner_occupied_housing_units] * 100).round
  end

  private 

  def data_usa_client
    @client ||= DataUsaClient.new
  end

  def find_city_overview
    data_usa_client.find_city_overview(geo_id)
  end

  def find_city_stats
    data_usa_client.find_city_stats(geo_id)
  end

  def transportation_data
    data_usa_client.find_transport_data(geo_id)
  end

  def ethnicity_data
    data_usa_client.find_ethnicity_data(geo_id)
  end
end