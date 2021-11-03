class Project < ApplicationRecord
  belongs_to :project_owner
  has_many :proposals

  validates :title, :description, :skills, :max_payment_hour, :limit_bid_date, presence: true
  validate :limit_bid_date_in_the_future
  
  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      where('title LIKE ? OR description LIKE ? OR skills LIKE ?', "%#{pattern}%", "%#{pattern}%", "%#{pattern}%")
    end
  end
  
  def limit_bid_date_in_the_future
    if limit_bid_date && limit_bid_date < Date.today
      errors.add(:limit_bid_date, "não pode está em datas passadas")
    end
  end
end
