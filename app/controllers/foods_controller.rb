class FoodsController < ApplicationController
  def index
    @search_word = params[:food_word]
    @total_count = UsdaFacade.new.find_total_count_by_ingredient(params[:food_word])
    @top_10_foods = UsdaFacade.new.find_10_foods_by_ingredient(params[:food_word])
  end
end