class TeamsController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]
  before_filter :require_permission, only: :edit

  def require_permission
    show
    if current_user != @team.user
      flash[:danger] = "Not authorised to edit players for " + @team.name 
      redirect_to root_path
    end
  end

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

def buy_reroll
  update_reroll(1)
end

def sell_reroll
  update_reroll(-1)
end

def update_reroll(amount)
  show
  @team.update(rerolls: @team.rerolls + amount)
  redirect_to edit_team_path
end

private
def team_params
  params.require(:team).permit(:name, :race, :league_id, :rerolls, :reroll_cost)
end

end
