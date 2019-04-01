class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    players = []
    @teams.each do |team|
      if !team.eliminated?
        team.players.each do |player|
          players << player if player.position == position
        end
      end
    end
    players
  end
end
