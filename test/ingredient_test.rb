require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < Minitest::Test

  def test_it_exists
    cheese = Ingredient.new("Cheese", "oz", 50)

    assert_instance_of Ingredient, cheese
  end

  def test_it_has_a_name
    cheese = Ingredient.new("Cheese", "oz", 50)

    assert_equal "Cheese", cheese.name
  end

  def test_it_has_a_unit
    cheese = Ingredient.new("Cheese", "oz", 50)

    assert_equal "oz", cheese.unit
  end

  def test_it_has_calories
    cheese = Ingredient.new("Cheese", "oz", 50)

    assert_equal 50, cheese.calories
  end
end
