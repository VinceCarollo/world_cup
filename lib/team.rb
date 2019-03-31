class Team
  attr_reader :country, :players
  attr_accessor :eliminated

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end

  def add(player)
    @players << player
  end

  def players_by_position(position)
    @players.find_all{|player| player.position == position}
  end
end
