class DataUsaClient

  def find_cities(city)
    get_json("/attrs/search/?kind=geo&q=#{city.parameterize}")
  end

  def find_city_overview(geo_id)
    get_json("/attrs/geo/#{geo_id}/")
  end

  def find_city_stats(geo_id)
    get_json("/api/?geo=#{geo_id}&#{acs_url}&force=acs.yg")
  end

  def find_city_name(geo_id)
    get_json("/attrs/geo/#{geo_id}/")
  end

  def find_transport_data(geo_id)
    get_json("/api/?geo=#{geo_id}&#{acs_url}&force=acs.yg_transport")
  end

  def find_ethnicity_data(geo_id)
    get_json("/api/?geo=#{geo_id}&#{acs_url}&force=acs.yg_race")
  end

  
  private
  
  def conn
    Faraday.new(url: 'https://api.datausa.io') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def acs_url
    'show=geo&sumlevel=place&year=latest'
  end
end