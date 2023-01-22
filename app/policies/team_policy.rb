# frozen_string_literal: true

class TeamPolicy < ApplicationPolicy
  def update?
    user && user == record.user
  end

  def destroy?
    user && user == record.user
  end
end