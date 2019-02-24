class City

  def initialize(data)
    city_name = data[4].split
    @geo_id = data[0]
    @city = city_name[0]
    @state = city_name[1]
  end
end