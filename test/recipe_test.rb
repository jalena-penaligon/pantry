require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def test_it_exists
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")

    assert_instance_of Recipe, mac_and_cheese
  end

  def test_it_has_a_name
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")

    assert_equal "Mac and Cheese", mac_and_cheese.name
  end

  def test_ingredients_required_starts_empty
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")

    expected = {}
    assert_equal expected, mac_and_cheese.ingredients_required
  end

  def test_you_can_add_ingredients
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    expected = {
      cheese => 2,
      mac => 8
    }

    assert_equal expected, mac_and_cheese.ingredients_required
  end

  def test_return_amount_needed_of_ingredients
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    assert_equal 2, mac_and_cheese.amount_required(cheese)
    assert_equal 8, mac_and_cheese.amount_required(mac)
  end

  def test_you_can_list_ingredients_needed
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    assert_equal [cheese, mac], mac_and_cheese.ingredients
  end

  def test_you_can_calculate_total_calories
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    assert_equal 440, mac_and_cheese.total_calories
  end

end
