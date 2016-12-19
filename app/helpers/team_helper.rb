module TeamHelper

	def loadData
		@data = YAML.load_file("#{Rails.root}/app/assets/data/teams.yml")
	end

	def races
		loadData
		return @data.keys.sort
	end

	def eligible_players(race)
		loadData
		return @data[race]['players']
	end

	def positions(race)
		return eligible_players(race).keys
	end

	def reroll_cost(race) 
		loadData
		return @data[race]['reroll']
	end

	def latest_results(league_id)
		Result.where(league_id: league_id, match_date: Result.maximum('match_date'))
	end

end
