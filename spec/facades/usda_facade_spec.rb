require 'rails_helper'

RSpec.describe UsdaFacade do
  describe "instance methods" do

    context "#find_10_foods_by_ingredient" do
      it "returns an array of OpenStruct objects that have w/ 4 attributes" do
        food = UsdaFacade.new

        expect(food.find_10_foods_by_ingredient("sweet potatoes")).to be_an(Array)
        expect(food.find_10_foods_by_ingredient("sweet potatoes").first).to be_an(OpenStruct)

        expect(food.find_10_foods_by_ingredient("sweet potatoes").first.gtin_upc).to eq("728229015529")
        expect(food.find_10_foods_by_ingredient("sweet potatoes").first.description).to eq("Sweets medley sel gris, batata, sweet potato, purple sweet potato real vegetable chips, sweets medley")
        expect(food.find_10_foods_by_ingredient("sweet potatoes").first.brand_owner).to eq("The Hain Celestial Group, Inc.")
        expect(food.find_10_foods_by_ingredient("sweet potatoes").first.ingredients).to eq("A blend of sweet potatoes (sweet potato, purple sweet potato, batata), avocado oil, sea salt.")
      end
    end

    context "#find_total_count_by_ingredient" do
      it "returns an OpenStruct objects with 1 attribute" do
        food = UsdaFacade.new

        expect(food.find_total_count_by_ingredient("sweet potatoes")).to be_an(OpenStruct)
        expect(food.find_total_count_by_ingredient("sweet potatoes").total_count).to eq(38114)
      end
    end

  end
end