require 'ostruct'

class UsdaFacade
  attr_reader :usda_service

  def initialize
    @usda_service = UsdaService.new
  end

  def find_10_foods_by_ingredient(food_word)
    usda_service.get_10_foods(food_word)[:foods].map do |food_info|
      OpenStruct.new(
        gtin_upc: food_info[:gtinUpc],
        description: food_info[:description].capitalize,
        brand_owner: food_info[:brandOwner],
        ingredients: food_info[:ingredients].capitalize
      )
    end
  end

  def find_total_count_by_ingredient(food_word)
    food_info = usda_service.get_10_foods(food_word)
    OpenStruct.new(total_count: food_info[:totalHits])
    # if only want to return an integer: food_info[:totalHits]
  end
 
end