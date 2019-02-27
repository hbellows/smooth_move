class Favorite < ApplicationRecord
  include DataUsaClientHelper

  belongs_to :user
  belongs_to :location

  validates :location, uniqueness: { scope: :user_id }

  scope :active, ->{ where(active: true) }
  scope :eliminated, ->{ where(active: false) }

  def city_name
    city_overview[:display_name]
  end

  def city_url
    city_overview[:url_name]
  end
end
