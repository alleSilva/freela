class ActuationArea < ApplicationRecord
  has_many :freelancer_profiles
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
end
