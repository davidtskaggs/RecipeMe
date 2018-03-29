module RecipesHelper

  def recipes_sort(recipes)
    # recipes.sort_by {|recipe| recipe.ratings.average(:score)}
    recipes.sort_by {|recipe| recipe.difficulty}
  end
end
