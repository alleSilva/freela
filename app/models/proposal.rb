class Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :project_owner
  belongs_to :freelancer
end
