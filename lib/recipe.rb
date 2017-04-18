class Recipe
  attr_reader :name, :ingredients

  def initialize(name)
    @name = name
    @ingredients = {}
  end

  def ingredient_types
    ingredients.keys
  end

  def add_ingredient(ingredient, amount)
    ingredients[ingredient] = amount
  end


end
