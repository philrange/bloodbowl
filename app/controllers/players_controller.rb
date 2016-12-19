class PlayersController < ApplicationController
	  
  before_action :authenticate_user!, :except => [:show, :index]
  before_filter :require_permission, only: :create

  def require_permission
  	team = Team.find(params[:player][:team_id])
    if current_user != team.user
    	flash[:alert] = "Not authorised to add players for " + team.name 
      redirect_to root_path
    end
  end

  include PlayersHelper

  def show
    @player = Player.find(params[:id])
  end

  def new
  	@player = Player.new
  end
 
  def create
  	@player = Player.new(player_params)

  	details = player_details(@player.team.race, @player.position)

  	@player.cost = details['cost']
  	@player.MA = details['MA']
  	@player.ST = details['ST']
  	@player.AG = details['AG']
  	@player.AV = details['AV']
  	@player.skills = details['skills']

  	@player.save
  	redirect_to edit_team_path(@player.team_id)
  end

  def destroy
  	@player = Player.find(params[:id])
    @player.destroy

    redirect_to edit_team_path(@player.team_id)
  end

  private
  def player_params
    params.require(:player).permit(:team_id, :name, :position, :cost, :MA, :ST, :AG, :AV, :skills)
  end

end
