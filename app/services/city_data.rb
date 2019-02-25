class CityData

  attr_reader :data

  def initialize(raw_data)
    headers = raw_data[:headers]
    info = raw_data[:data].flatten
    @data = headers.zip(info).to_h.symbolize_keys
  end
end
