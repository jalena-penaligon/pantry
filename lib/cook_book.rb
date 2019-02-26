class CookBook
  attr_reader :summary

  def initialize
    @summary = []
  end

  def ingredient_details(recipe)
    details = recipe.ingredients_required.map do |ingredient, amount|
      {ingredient: ingredient.name,
        amount: "#{amount} #{ingredient.unit}"}
    end.sort_by do |ingredient|
      ingredient[:amount]
    end.reverse
  end

  def recipe_details(recipe)
    {
      name: recipe.name,
      details: {ingredients: ingredient_details(recipe),
                total_calories: recipe.total_calories}
    }
  end

  def add_recipe(recipe)
    @summary << recipe_details(recipe)
  end

end
