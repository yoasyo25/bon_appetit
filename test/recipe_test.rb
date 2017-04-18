require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RecipeTest < Minitest::Test

  def test_it_exists
    recipe = Recipe.new("Cheese Pizza")
    assert_instance_of Recipe, recipe
  end

  def test_ingridents_start_empty
    recipe = Recipe.new("Cheese Pizza")
    assert_equal ({}), recipe.ingredients
  end

  def test_it_can_add_an_ingredient
    recipe = Recipe.new("Cheese Pizza")
    recipe.add_ingredient("Flour", 20)
    recipe.add_ingredient("Cheese", 20)

    assert_equal ({"Cheese" => 20, "Flour" => 20}), recipe.ingredients
  end


end
