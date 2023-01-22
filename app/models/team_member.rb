class TeamMember < ApplicationRecord
  belongs_to :team
  belongs_to :user

  enum role: { user: 0, leader: 1}
end
