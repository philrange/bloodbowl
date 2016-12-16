module LeaguesHelper

	def my_leagues(user_id)
		teams = Team.where(user_id: user_id)
		teams.map {|team| League.find(team.league_id) }.to_set
	end
end
