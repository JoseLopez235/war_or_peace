require "minitest/autorun"
require "minitest/pride"
require './lib/player'

class PlayerTest < Minitest::Test
  def test_should_exists
    player_1 = Player.new("Jose")

    assert_instance_of Player, player_1
  end

  def test_should_return_player_name
    player_1 = Player.new("Jose")

    assert_equal "Jose", player_1.name
  end
end
