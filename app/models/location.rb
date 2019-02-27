class Location < ApplicationRecord
  include DataUsaClientHelper

  has_many :favorites
  has_many :users, through: :favorites

  
  def name
    city_overview[:display_name]
  end

  def url
    city_overview[:url_name]
  end
end
