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

  def transportation_stats
    CityData.new(find_transportation_data).data
  end

  def drive
    transportation_stats[:transport_cartruckorvan].to_i
  end

  def carpool
    transportation_stats[:transport_carpooled].to_i
  end

  def public_transport
    transportation_stats[:transport_publictrans].to_i
  end

  def motorcycle
    transportation_stats[:transport_motorcycle]
  end
  
  def bike
    transportation_stats[:transport_bicycle].to_i
  end

  def walk
    transportation_stats[:transport_walked]
  end

  def ethnicity_stats
    CityData.new(find_ethnicity_data).data
  end

  def multi_racial
    ethnicity_stats[:pop_2ormore].to_i
  end

  def asian
    ethnicity_stats[:pop_asian].to_i
  end

  def black
    ethnicity_stats[:pop_black].to_i
  end

  def hawaiian
    ethnicity_stats[:pop_hawaiian].to_i
  end

  def latinx
    ethnicity_stats[:pop_latino].to_i
  end

  def native_american
    ethnicity_stats[:pop_native].to_i
  end

  def white
    ethnicity_stats[:pop_white].to_i
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

  def find_transportation_data
    data_usa_client.find_transport_data(geo_id)
  end

  def find_ethnicity_data
    data_usa_client.find_ethnicity_data(geo_id)
  end
end