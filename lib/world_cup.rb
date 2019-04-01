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

  def initiate_positions
    positions = []
    @teams.each do |team|
      positions << team.players.map do |player|
        player.position
      end
    end
    positions.flatten.uniq
  end

  def all_players_by_position
    positions = {}
    initiate_positions.each do |position|
      positions[position] = []
    end

    @teams.each do |team|
      team.players.each do |player|
        positions.each do |position, players|
          players << player if position == player.position
        end
      end
    end
    positions
  end
end
