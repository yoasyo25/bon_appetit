class Recipe
  attr_reader :name, :ingredients

  def initialize(name)
    @name = name
    @ingredients = Hash.new(0)
  end

  def ingredient_types
    ingredients.keys
  end

  def add_ingredient(ingredient, amount)
    ingredients[ingredient] = amount
  end

  def amount_required(ingredient_name)
    @ingredients[ingredient_name]
  end

end
