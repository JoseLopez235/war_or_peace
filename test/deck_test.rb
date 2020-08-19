require "minitest/autorun"
require "minitest/pride"
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def test_should_exsit
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:club, 5, 5)
    card_3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card_1, card_2, card_3])

    assert_instance_of Deck, deck
  end

  def test_if_deck_is_returned
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:club, 5, 5)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_should_card_in_index
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:club, 5, 5)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal card_1, deck.rank_of_card_at(0)
    assert_equal card_3, deck.rank_of_card_at(2)
  end
end
