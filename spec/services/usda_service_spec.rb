require 'rails_helper'

RSpec.describe UsdaService do
  describe "instance methods" do 
    context "#fetch_api" do
      it "#get_10_foods(food_word)" do
        food_service = UsdaService.new
        food = food_service.get_10_foods("sweet potatoes")

        expect(food).to be_a(Hash)
        expect(food.keys.count).to eq(7)
        expect(food.keys).to eq([:totalHits, :currentPage, :totalPages, :pageList, :foodSearchCriteria, :foods, :aggregations])
      end
    end 
  end
end