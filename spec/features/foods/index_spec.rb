require 'rails_helper'

RSpec.describe "/foods", type: :feature do
  describe "as a visitor, when search for an ingredient I'm redirected to the food index page" do
    it "displays total count, 10 foods with 4 attributes each" do
      visit root_path
      
      fill_in("q", with: "sweet potatoes")
      click_on("Search")

      expect(current_path).to eq("/foods")

      expect(page).to have_content("Top 10 Foods")
      expect(page).to have_content("Total Count: 38114")

      expect(page).to have_content("GTIN/UPC code:", count: 10)

      # within #
    end
  end
end