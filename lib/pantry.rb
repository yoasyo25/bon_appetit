class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    @stock[:item]
  end

  def restock(item, amount)
    @stock[:item] = amount 
  end


end
