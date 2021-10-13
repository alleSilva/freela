class Project < ApplicationRecord
  validates :title, :description, :skills, :max_payment_hour, :limit_bid_date, presence: {message: 'Esse campo não pode ficar em branco'}
end
