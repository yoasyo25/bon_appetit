class Pantry
  attr_reader :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
  end

  def stock_check(item)
    @stock[item]
  end

  def restock(item, amount)
    if @stock[item]
      @stock[item] += amount
    else
      @stock[item] = amount
    end
  end

  def add_to_shopping_list(recipe)
    @shopping_list[recipe.name] = recipe.ingredients

  end



end
