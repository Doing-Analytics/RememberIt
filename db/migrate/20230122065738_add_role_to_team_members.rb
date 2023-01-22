class AddRoleToTeamMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :team_members, :role, :integer
  end
end
