class Project < ApplicationRecord
  validates :title, :description, :skills, :max_payment_hour, :limit_bid_date, presence: true
  belongs_to :project_owner
  
  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      where('title LIKE ?', "%#{pattern}%")
    end
  end
end
