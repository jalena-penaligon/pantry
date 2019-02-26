require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_stock_starts_empty
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    expected = {}
    assert_equal expected, pantry.stock
    assert_equal 0, pantry.stock_check(cheese)
  end

  def test_you_can_restock_ingredients
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)

    assert_equal 15, pantry.stock_check(cheese)
  end

  def test_check_if_you_have_enough_ingredients
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)

    assert_equal false, pantry.enough_ingredients_for?(mac_and_cheese)

    pantry.restock(mac, 8)
    assert_equal true, pantry.enough_ingredients_for?(mac_and_cheese)
  end

end
