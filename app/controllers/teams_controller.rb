class TeamsController < ApplicationController

  respond_to :js, :html, :json

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

def edit
  @team = Team.find(params[:id])
  if @team.finalised
    redirect_to team_path
  end
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

def finalise
  show
  if (@team.budget < 0)
    flash[:alert] = 'You\'re over budget. Can\'t finalise team.'
    redirect_to edit_team_path
  else
    @team.update_attribute("treasury", @team.budget)
    @team.update_attribute("finalised", true)
    redirect_to team_path
  end
end

def undo_finalise
  toggle_boolean_field("finalised")
  redirect_to edit_team_path
end

def buy_item
  @new_amount = update_field(params[:item], 1)
  respond_to do |format|
    format.js
  end
end

def sell_item
  @new_amount = update_field(params[:item], -1)
  respond_to do |format|
    format.js
  end
end

def toggle_item
  @new_value = toggle_boolean_field(params[:item])
  respond_to do |format|
    format.js
  end
end

def update_field(field, amount)
  show
  current_amount = @team[field] || 0
  new_amount = current_amount + amount
  @team.update_attribute(field, new_amount)
  return new_amount
end

def toggle_boolean_field(field)
  show
  current_value = @team[field] || false
  @team.update_attribute(field, !current_value)
  return !current_value
end

private
def team_params
  params.require(:team).permit(:name, :race, :league_id, :rerolls, :reroll_cost)
end

end
