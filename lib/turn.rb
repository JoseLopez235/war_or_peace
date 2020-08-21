class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      :basic
    elsif @player1.deck.rank_of_card_at(2).nil? || @player2.deck.rank_of_card_at(2).nil?
      :no_war
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank &&
      @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war
    end
  end

  def pile_cards
    @spoils_of_war.clear
    if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0..2]
      @spoils_of_war << @player2.deck.cards[0..2]
      @spoils_of_war.flatten!
    end
  end

  def war_and_mutually_assured_destruction_deleter
    3.times do
      @player1.deck.remove_card
      @player2.deck.remove_card
    end
  end

  def winner
    if type == :basic
      basic
    elsif type == :mutually_assured_destruction
      pile_cards
      return "No Winner"
    elsif type == :war
      war
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each { |card| winner.deck.add_card(card)}
  end

  def basic
    if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
      @player1
    else
      @player2
    end
  end

  def war
    if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
      @player1
    else
      @player2
    end
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
          The players today are Megan and Aurora."
    puts "Type 'GO' yo start the game!"

    input = gets.chomp.upcase
    count = 0
    if input == "GO"
      while count != 20
        player = winner
        pile_cards

        if type == :no_war && @player1.deck.rank_of_card_at(2).nil?
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          break
        elsif type == :no_war && @player2.deck.rank_of_card_at(2).nil?
          p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
          break
        end

        if type == :basic
          p "#{player.name} won #{@spoils_of_war.length} cards"
          @player1.deck.remove_card
          @player2.deck.remove_card
        elsif type == :war
          p "WAR - #{player.name} won #{@spoils_of_war.length} cards"
          war_and_mutually_assured_destruction_deleter
        elsif type == :mutually_assured_destruction
          p "*mutually_assured_destruction* #{player} 6 cards removed from play"
          war_and_mutually_assured_destruction_deleter
        end

        if type != :mutually_assured_destruction
          award_spoils(player)
        end

        if @player1.has_lost?
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          break
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          break
        end
        count += 1
      end
    else
      start
    end
  end
end
