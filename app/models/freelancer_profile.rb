class FreelancerProfile < ApplicationRecord
  belongs_to :actuation_area
  belongs_to :freelancer
  has_one_attached :image
end
