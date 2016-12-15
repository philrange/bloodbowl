class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end
 
  def show
    @team = Team.find(params[:id])
  end

  def new
  	@team = Team.new
  end
 
  def create
  	@team = Team.new(team_params)

    @team.user_id = current_user.id if current_user
  	@team.save
  	redirect_to @team
  end

  private
  def team_params
    params.require(:team).permit(:name, :race, :league_id)
  end

end
