require_relative 'player'
require_relative 'deck'
require_relative 'card'
require_relative 'turn'
require_relative 'card_generator'

deck = CardGenerator.new("lib/cards.txt").cards.shuffle

deck1 = Deck.new(deck[0..25])
deck2 = Deck.new(deck[26..51])

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

war = Turn.new(player1, player2)
war.start
