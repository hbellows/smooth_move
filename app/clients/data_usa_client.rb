class DataUsaClient

  def find_cities(city)
    get_json("/attrs/search/?kind=geo&q=#{city.parameterize}")
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
end