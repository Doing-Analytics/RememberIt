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
    @team_members = TeamMember.new(user: current_user, team: @team, role: 1)

    if @team.save && @team_members.save
      redirect_to teams_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to teams_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team.team_members.destroy_all
    @team.destroy

    redirect_to teams_url
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end

  def find_team
    @team = Team.find(params[:id])
  end
end
