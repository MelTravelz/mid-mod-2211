require 'rails_helper'

RSpec.describe "/foods", type: :feature do
  describe "as a visitor, when search for an ingredient I'm redirected to the food index page" do
    it "displays total count, 10 foods with 4 attributes each" do
      visit root_path
      
      fill_in("food_word", with: "sweet potatoes")
      click_on("Search")

      expect(current_path).to eq("/foods")

      expect(page).to have_content("Search Results")
      expect(page).to have_content("Total Count: 38114")
      
      expect(page).to have_content("Top 10 Foods:")
      expect(page).to have_content("GTIN/UPC Code:", count: 10)

      within "#food-728229015529" do
        expect(page).to have_content("GTIN/UPC Code: 728229015529")
        expect(page).to have_content("Description: Sweets medley sel gris, batata, sweet potato, purple sweet potato real vegetable chips, sweets medley")
        expect(page).to have_content("Brand: The Hain Celestial Group, Inc.")
        expect(page).to have_content("Ingredients: A blend of sweet potatoes (sweet potato, purple sweet potato, batata), avocado oil, sea salt.")
      end
    end
  end
end