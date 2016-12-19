class CalculatePoints

	def initialize(league, team)
		@league = league
		@team = team
		@played = 0
		@won = 0
		@drawn = 0
		@lost = 0
		@points = 0
	end

	def call
		results = Result.where(league_id: @league.id)

		results.each do |result|
			if result.home_team_id == @team.id
				@played += 1
				add_up_wins(result.home_team_score, result.away_team_score)
			elsif result.away_team_id == @team.id
				@played += 1
				add_up_wins(result.away_team_score, result.home_team_score)
			end
		end

		@points = (@won * 3) + @drawn
		# @points = @played > 0 ? @won.fdiv(@played) : 0

		return Points.new(@team, @played, @won, @drawn, @lost, @points)
	end

	def add_up_wins(team_score, other_team_score)
		if team_score > other_team_score
			@won += 1
		elsif team_score < other_team_score
			@lost += 1
		else
			@drawn += 1
		end
	end

end


	class Points
		attr_reader :team, :played, :won, :drawn, :lost, :points


		def initialize(team, played, won, drawn, lost, points)
			@team = team
			@played = played
			@won = won
			@drawn = drawn
			@lost = lost
			@points = points
		end

	end