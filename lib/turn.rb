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
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank &&
      @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      @player1.deck.remove_card
      @player2.deck.remove_card
    elsif type == :mutually_assured_destruction
      war_and_mutually_assured_destruction_deleter
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0..2]
      @spoils_of_war << @player2.deck.cards[0..2]
      @spoils_of_war.flatten!
      war_and_mutually_assured_destruction_deleter
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
end
