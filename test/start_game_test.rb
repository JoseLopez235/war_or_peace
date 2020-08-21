require "minitest/autorun"
require "minitest/pride"
require "./lib/start_game"

class StartGameTest < Minitest::Test
  def test_should_exists
    start_game = StartGame.new

    assert_instance_of StartGame, start_game
  end

  def test_should_return_prompt
    start_game = StartGame.new

    expected = "Welcome to War! (or Peace) This game will be played
    with 52 cards. The players today are Megan and Aurora."

    assert_equal expected, start_game.prompt
  end
end
