require "minitest/autorun"
require "minitest/pride"
require "./lib/start_game"

class StartGameTest < Minitest::Test
  def test_should_exists
    start_game = StartGame.new

    assert_instance_of StartGame, start_game
  end
end
