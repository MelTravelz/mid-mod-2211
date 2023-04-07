class UsdaService
  def fetch_api(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_10_foods(food_word)
    fetch_api("foods/search?pageSize=10&ingredients=#{food_word}")
  end
  
  private
  def connection
    Faraday.new(url: "https://api.nal.usda.gov/fdc/v1/", params: { api_key: ENV["api_key"] })
  end
end