module RecipesHelper

  def recipes_sort(recipes)
    recipes_rating = []

    recipes.each do |recipe|
      unless recipe.ratings.blank?
        recipes_rating.push(recipe)
      end
    end
    recipes_rating.sort_by {|recipe| recipe.ratings.average(:score)}
  end
end

# recipes.sort_by {|recipe| recipe.difficulty}
