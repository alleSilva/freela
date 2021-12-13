class AddActuationAreaRefToFreelancerProfile < ActiveRecord::Migration[6.1]
  def change
    add_reference :freelancer_profiles, :actuation_area, null: false, foreign_key: true
  end
end
