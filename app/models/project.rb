class Project < ApplicationRecord
  validates :title, :description, :skills, :max_payment_hour, :limit_bid_date, presence: true
  belongs_to :project_owner
  has_many :proposals
  
  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      where('title LIKE ? OR description LIKE ? OR skills LIKE ?', "%#{pattern}%", "%#{pattern}%", "%#{pattern}%")
    end
  end
end
