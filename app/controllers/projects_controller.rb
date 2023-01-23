class ProjectsController < ApplicationController
  before_action :find_team, only: [:new, :create]
  
  def index
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

  private

  def find_team
    @team = Team.find(params[:team_id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
