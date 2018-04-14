class WelcomeController < ApplicationController
  include RecipesHelper

  def index
    @recipes = Recipe.all
    @recipes_by_rating = recipes_sort(@recipes).reverse.first(8)
  end

  def about

  end

end
