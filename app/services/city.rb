class City

  attr_reader :geo_id, :city_name

  def initialize(data)
    @geo_id = data[0]
    @city_name = data[4]
  end
end