require 'rails_helper'

RSpec.describe UsdaFacade do
  describe "instance methods" do
    context "#find_10_foods_by_ingredient" do
      it "returns an array of food objects" do
        food = UsdaFacade.new

        expect(food.find_10_foods_by_ingredient("sweet potatoes")).to be_an(Array)
      end
    end
  end
end