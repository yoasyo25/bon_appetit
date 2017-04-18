require './lib/pantry'
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

  def test_it_can_count_the_amount_of_stock
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

end
