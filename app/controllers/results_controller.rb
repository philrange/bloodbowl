class ResultsController < ApplicationController

def index
  @results = Result.order('match_date desc')
end

def show
  @result = Result.find(params[:id])
end

def new
 @result = Result.new
end

def create
 @result = Result.new(result_params)

 @result.league_id = params[:league_id]

 @result.save
 redirect_to league_result_path(@result.league_id, @result.id)
end

private
def result_params
  params.require(:result).permit(:match_date, :league_id, :home_team_id, :home_team_score, :away_team_id, :away_team_score)
end

end
