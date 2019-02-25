# frozen_string_literal: true

require 'rails_helper'

describe City do
  it 'can be created with attributes' do
    attributes = [
      "16000US0820000", 
      "denver co", 
      9.50230549744445, 
      "geo", 
      "Denver, CO", 
      "160", 
      -1, 
      "denver-co"
    ]

    city = City.new(attributes)

    expect(city.city_name).to eq('Denver, CO')
    expect(city.geo_id).to eq('16000US0820000')
  end
end