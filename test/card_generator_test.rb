require "minitest/autorun"
require "minitest/pride"
require "./lib/card_generator"


class CardGeneratorTest < Minitest::Test

  def test_should_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_should_return_an_array_of_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    assert_equal "cards.txt", cards.filename
  end
end
