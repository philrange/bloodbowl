class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end
 
  def show
    @league = League.find(params[:id])
  end

  def new
  	@league = League.new
  end
 
  def create
  	@league = League.new(league_params)

    @league.user_id = current_user.id if current_user
  	@league.save
  	redirect_to @league
  end

  private
  def league_params
    # params.require(:name).permit(:title, :text)
    params.require(:league).permit(:name)
  end
end
