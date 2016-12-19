module PlayersHelper

  include TeamHelper

  def player_details(race, position)
	return eligible_players(race)[position]
  end

end
