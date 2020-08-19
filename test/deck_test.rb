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

  def test_should_return_all_high_ranking_cards
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:club, 5, 5)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal [card_1, card_3], deck.high_ranking_cards
  end

  def test_should_return_percentage_of_high_ranked_cards
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:club, 5, 5)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_should_remove_first_card_in_deck
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:club, 5, 5)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    deck.remove_card
    assert_equal [card_2, card_3], deck.cards
  end

  def test_should_add_new_card_at_the_end_of_the_deck
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:club, 5, 5)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_2, card_3]
    deck = Deck.new(cards)

    deck.add_card(card_1)
    assert_equal [card_2, card_3, card_1], deck.cards
  end
end
