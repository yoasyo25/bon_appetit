class Pantry
  attr_reader :stock, :shopping_list, :cookbook

  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cookbook = []
  end

  def stock_check(item)
    stock[item]
  end

  def restock(item, amount)
    stock[item] += amount
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |ingredient, amount|
      shopping_list[ingredient] += amount
    end
  end

  def print_shopping_list
    shopping_list_output = ""
    shopping_list.each do |ingredient, amount|
      shopping_list_output << "* #{ingredient}: #{amount}\n"
    end
    shopping_list_output.chop
  end

  def add_to_cookbook(recipe)
    cookbook << recipe
  end

end
