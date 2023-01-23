# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def destroy?
    user && user == record
  end
end