class ActuationArea < ApplicationRecord
  has_many :freelancer_profiles
  validates :name, presence: true
end
