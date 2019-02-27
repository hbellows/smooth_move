# frozen_string_literal: true

class CityInformation
  include TransportationDataHelper
  include EthnicityDataHelper
  include DataUsaClientHelper
  include CityDataHelper

  attr_reader :geo_id

  def initialize(geo_id)
    @geo_id = geo_id
  end
end