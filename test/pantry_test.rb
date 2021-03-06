require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

  def test_it_starts_with_an_empty_stock
    pantry = Pantry.new
    assert_equal ({}), pantry.stock
  end

  def test_it_can_returns_zero_for_stock_check
    pantry = Pantry.new
    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_it_can_count_the_amount_of_stock
    pantry = Pantry.new

    pantry.restock("Cheese", 10)

    assert_equal 10, pantry.stock_check("Cheese")
  end

  def test_it_can_add_to_stock
    pantry = Pantry.new

    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_can_add_to_shopping_list
    recipe = Recipe.new("Cheese Pizza")
    recipe.add_ingredient("Flour", 20)
    recipe.add_ingredient("Cheese", 20)
    pantry = Pantry.new

    pantry.add_to_shopping_list(recipe)

    assert_equal ({"Cheese" => 20, "Flour" => 20}), pantry.shopping_list
  end

  def test_it_can_add_another_shopping_list
    r1 = Recipe.new("Spaghetti")
    r2 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)
    r2.add_ingredient("Noodles", 10)
    r2.add_ingredient("Sauce", 10)
    r2.add_ingredient("Cheese", 5)
    pantry = Pantry.new

    pantry.add_to_shopping_list(r1)
    assert_equal ({"Cheese" => 20, "Flour" => 20}), pantry.shopping_list

    pantry.add_to_shopping_list(r2)
    assert_equal ({"Cheese" => 25, "Flour" => 20, "Noodles" => 10, "Sauce" => 10}), pantry.shopping_list
  end

  def test_it_can_print_a_shopping_list
    r1 = Recipe.new("Spaghetti")
    r2 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)
    r2.add_ingredient("Noodles", 10)
    r2.add_ingredient("Marinara Sauce", 10)
    r2.add_ingredient("Cheese", 5)
    pantry = Pantry.new

    pantry.add_to_shopping_list(r1)
    pantry.add_to_shopping_list(r2)

    assert_equal "* Cheese: 25\n* Flour: 20\n* Noodles: 10\n* Marinara Sauce: 10", pantry.print_shopping_list
  end


  def test_cookbook_takes_in_recipes
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)

    r2 = Recipe.new("Pickles")
    r2.add_ingredient("Brine", 10)
    r2.add_ingredient("Cucumbers", 30)

    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)

    pantry = Pantry.new

    pantry.add_to_cookbook(r1)
    pantry.add_to_cookbook(r2)
    pantry.add_to_cookbook(r3)

    assert_equal [r1, r2, r3], pantry.cookbook
  end

end
