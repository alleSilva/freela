class Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :project_owner
  belongs_to :freelancer

  validates :resume, :payment_hour, :week_hours, :conclusion_date, presence: true
  validate :conclusion_date_greater_last_aplication_date
  #validate :should_have_one_proposal_per_project
  enum status: {pending: 5, accepted: 10, rejected: 20}
  
  def conclusion_date_greater_last_aplication_date
      if conclusion_date < project.limit_bid_date
        errors.add(:conclusion_date, "não pode ser menor que a data de aplicação")
      end
  end

  #def should_have_one_proposal_per_project
   # begin
    #  byebug
     # if project_owner.projects.first.proposals.where(freelancer_id: freelancer_id).count == 1
      #  errors.add(:base, "alredy exists for this project")
      #end
    #rescue
     # return
    #end
    
  #end
end