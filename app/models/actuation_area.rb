class ActuationArea < ApplicationRecord
  has_many :freelancer_profiles, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
