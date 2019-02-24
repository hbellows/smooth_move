class CityFinder

  attr_reader :city

  def initialize(city)
    @city = city
  end

  def city_matches
    city_data.map do |data|
      if data[5] == "160"
        City.new(data)
      end
    end
  end

  private

  def data_usa_client
    @client ||= DataUsaClient.new
  end

  def city_data
    data_usa_client.find_cities(city)[:data]
  end
end