class Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :project_owner
  belongs_to :freelancer

  validates :resume, :payment_hour, :week_hours, :conclusion_date, presence: true
  validate :conclusion_date_greater_last_aplication_date
  enum status: { pending: 5, accepted: 10, rejected: 20 }

  def conclusion_date_greater_last_aplication_date
    return unless conclusion_date < project.limit_bid_date

    errors.add(:conclusion_date, 'não pode ser menor que a data de aplicação')
  end
end
