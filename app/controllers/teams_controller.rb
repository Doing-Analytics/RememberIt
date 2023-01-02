class TeamsController < ApplicationController
  before_action :find_team, only: [:edit, :update, :destroy]

  def index
    @teams = current_user.teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      current_user.teams << @team
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to teams_path
    else
      render :edit
    end
  end

  def destroy
    current_user.teams.destroy(@team)
    @team.delete

    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end

  def find_team
    @team = Team.find(params[:id])
  end
end
