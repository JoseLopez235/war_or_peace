require "minitest/autorun"
require "minitest/pride"
require "./lib/card_generator"


class CardGeneratorTest < Minitest::Test

  def test_should_exists
    filename = "lib/cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_should_file_name
    filename = "lib/cards.txt"
    cards = CardGenerator.new(filename)

    assert_equal "lib/cards.txt", cards.filename
  end

  def test_should_return_an_array_of_cards
    filename = "lib/cards.txt"
    deck = CardGenerator.new(filename)

    assert_equal 52, deck.cards.length
  end
end
