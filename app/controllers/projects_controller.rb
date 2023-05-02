class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update, :destroy]
  before_action :find_team, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :find_team_leader, only: [:destroy]

  def index
    @projects = @team.projects
  end

  def new
    @project = @team.projects.new
  end

  def create
    @project = @team.projects.new(project_params)

    if @project.save
      redirect_to team_projects_path, notice: '專案建立成功'
    else
      render :new, status: :unprocessable_entity, alert: '新增失敗'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to team_projects_path, notice: '專案編輯成功'
    else
      render :edit, status: :unprocessable_entity, alert: '編輯失敗'
    end
  end

  def destroy
    authorize @team_leader.user, :destroy?, policy_class: ProjectPolicy
    @project.destroy

    redirect_to team_projects_path, notice: '專案刪除成功'
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def find_team
    @team = Team.find(params[:team_id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def find_team_leader
    @team_leader = TeamMember.where(team: @team).find_by!(role: 'leader')
  end
end
