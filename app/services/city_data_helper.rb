# frozen_string_literal: true

module CityDataHelper

  def info_year
    city_stats[:year]
  end

  def city_name
    city_overview[:display_name]
  end

  def city_url
    city_overview[:url_name]
  end

  def population
    city_stats[:pop]
  end

  def pop_rank
    city_stats[:pop_rank].to_i
  end

  def average_age
    city_stats[:age]
  end

  def non_us_citizens
    (city_stats[:non_us_citizens] * 100).round
  end

  def mean_commute
    (city_stats[:mean_commute_minutes]).round
  end

  def average_income
    city_stats[:income].to_i
  end

  def income_rank
    city_stats[:income_rank].to_i
  end

  def average_property_value
    city_stats[:median_property_value]
  end

  def owner_occupied
    (city_stats[:owner_occupied_housing_units] * 100).round
  end

end