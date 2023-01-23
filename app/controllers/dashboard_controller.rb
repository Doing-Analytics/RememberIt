class DashboardController < ApplicationController
  def show
    @teams = current_user.teams
  end
end
