class TeamsController < ApplicationController
  before_action :find_team, only: [:show, :edit, :update, :destroy]
  before_action :find_team_leader, only: [:edit, :update, :destroy]

  def index
    @teams = current_user.teams
  end

  def show
    @projects = @team.projects
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team_member = TeamMember.new(user: current_user, team: @team, role: 1)

    if @team.save && @team_member.save
      redirect_to teams_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @team_leader, policy_class: TeamPolicy
  end

  def update
    authorize @team_leader, policy_class: TeamPolicy

    if @team.update(team_params)
      redirect_to teams_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @team_leader, policy_class: TeamPolicy

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

  def find_team_leader
    @team_leader = TeamMember.includes(:team).find_by!(role: 'leader')
  end
end
