require 'minitest/autorun'
require './lib/player'
require './lib/team'
require './lib/world_cup'

class WorldCupTest < Minitest::Test
  attr_reader :mbappe,
              :pogba,
              :modric,
              :vida,
              :france,
              :croatia


  def setup
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
  end

  def test_it_exists
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_instance_of WorldCup, world_cup
  end

  def test_it_has_attributes
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal 2018, world_cup.year
  end

  def test_it_can_give_teams
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal [france, croatia], world_cup.teams
  end

  def test_it_can_give_players_by_position
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia.add_player(modric)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal [pogba, modric], world_cup.active_players_by_position("midfielder")
  end

  def test_it_it_only_gives_players_that_are_not_eliminated
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia.add_player(modric)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])
    croatia.eliminated = true

    assert_equal [pogba], world_cup.active_players_by_position("midfielder")
  end

  def test_it_can_get_ALL_players_by_position
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia.add_player(modric)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])

    expected = {
    "forward" => [mbappe],
    "midfielder" => [pogba, modric],
    "defender" => [vida]
    }

    assert_equal expected, world_cup.all_players_by_position
  end
end
