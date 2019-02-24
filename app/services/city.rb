class City

  attr_reader :geo_id, :city_name, :city, :state
  def initialize(data)
    split_city_name = data[4].split
    @geo_id = data[0]
    @city_name = data[4]
    @city = split_city_name[0]
    @state = split_city_name[1]
  end
end