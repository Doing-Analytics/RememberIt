class HomeController < ApplicationController
  skip_before_action :require_login, only: :show
  def show
    redirect_to controller: 'dashboard', action: 'show' and return if current_user
  end
end
