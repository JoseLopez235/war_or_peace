require_relative 'player'
require_relative 'deck'
require_relative 'card'
require_relative 'turn'
require_relative 'card_generator'

class GameStart
  def initialize
    deck = CardGenerator.new("lib/cards.txt").cards.shuffle
    deck1 = Deck.new(deck[0..25])
    deck2 = Deck.new(deck[26..51])

    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)

    @game = Turn.new(@player1, @player2)
    @count = 0
  end

  def prompt
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
          The players today are Megan and Aurora."
    puts "Type 'GO' yo start the game!"
  end

  def start
    prompt
    input = gets.chomp.upcase
    if input == "GO"
      while @count != 1000001
        break if lost() == true
        break if war_lost() == true
        player = @game.winner
        @game.pile_cards
        turns(player)
        rewards(player)
        @count += 1
      end
    else
      start
    end
  end

    def lost
      if @player1.has_lost?
        p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        true
      elsif @player2.has_lost?
        p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        true
      elsif @count == 1000000
        p "*~*~*~* DRAW *~*~*~*"
        true
      end
    end

    def war_lost
      if @game.type == :no_war && @player1.deck.rank_of_card_at(2).nil?
        p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        true
      elsif @game.type == :no_war && @player2.deck.rank_of_card_at(2).nil?
        p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        true
      end
    end

    def turns(player)
      if @game.type == :basic
        p "Turn #{@count}: #{player.name} won #{@game.spoils_of_war.length} cards"
        @player1.deck.remove_card
        @player2.deck.remove_card
      elsif @game.type == :war
        p "WAR - Turn #{@count}: #{player.name} won #{@game.spoils_of_war.length} cards"
        @game.war_and_mutually_assured_destruction_deleter
      elsif @game.type == :mutually_assured_destruction
        p "Turn #{@count}: *mutually_assured_destruction* #{player} 6 cards removed from play"
        @game.war_and_mutually_assured_destruction_deleter
      end
    end

    def rewards(player)
      if @game.type != :mutually_assured_destruction
        @game.award_spoils(player)
      end
    end

end
