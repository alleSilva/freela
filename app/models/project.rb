class Project < ApplicationRecord
  validates :title, :description, :skills, :max_payment_hour, :limit_bid_date, presence: true
  belongs_to :project_owner  
end
