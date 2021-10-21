class FreelancerProfile < ApplicationRecord
  belongs_to :actuation_area
  belongs_to :freelancer
  has_one_attached :image

  validates :name, :social_name, :birth_date, :description, :education, :experience, presence: true
end
