require 'minitest/autorun'
require './lib/player'
require './lib/team'


class TeamTest < Minitest::Test
  attr_reader :team,
              :mbappe,
              :pogba

  def setup
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  def test_it_exists
    assert_instance_of Team, team
  end

  def test_it_has_attributes
    assert_equal "France", team.country
  end

  def test_it_can_be_eliminated
    refute team.eliminated?

    team.eliminated = true

    assert team.eliminated?
  end

  def test_it_starts_with_no_players
    assert_equal [], team.players
  end

  def test_it_can_add_player_players
    team.add_player(mbappe)
    team.add_player(pogba)

    assert_equal [mbappe, pogba], team.players
  end

  def test_it_can_get_players_by_position
    team.add_player(mbappe)
    team.add_player(pogba)

    assert_equal [pogba], team.players_by_position("midfielder")
    assert_equal [], team.players_by_position("defender")
  end
end
