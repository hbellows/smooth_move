# frozen_string_literal: true

module DataUsaClientHelper

  def city_overview
    CityData.new(find_city_overview).data
  end

  def city_stats
    CityData.new(find_city_stats).data
  end

  def transportation_stats
    CityData.new(find_transportation_data).data
  end

  def ethnicity_stats
    CityData.new(find_ethnicity_data).data
  end

  private 

  def data_usa_client
    @client ||= DataUsaClient.new
  end

  def find_city_overview
    @overview ||= data_usa_client.find_city_overview(geo_id)
  end

  def find_city_stats
    @city_stats ||= data_usa_client.find_city_stats(geo_id)
  end

  def find_transportation_data
    @transportation ||= data_usa_client.find_transport_data(geo_id)
  end

  def find_ethnicity_data
    @ethnicity ||= data_usa_client.find_ethnicity_data(geo_id)
  end
end