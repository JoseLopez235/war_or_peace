require "minitest/autorun"
require "minitest/pride"
require './lib/player'
require './lib/card'
require './lib/deck'

class PlayerTest < Minitest::Test
  def test_should_exists
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:club, 5, 5)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    player_1 = Player.new("Jose", deck)

    assert_instance_of Player, player_1
  end

  def test_should_return_player_name
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:club, 5, 5)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    player_1 = Player.new("Jose", deck)

    assert_equal "Jose", player_1.name
  end

  def test_should_return_player_deck
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:club, 5, 5)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    player_1 = Player.new("Jose", deck)

    assert_equal deck, player_1.deck
  end
end
