class FreelancerProfile < ApplicationRecord
  belongs_to :actuation_area
  has_one_attached :image
end
