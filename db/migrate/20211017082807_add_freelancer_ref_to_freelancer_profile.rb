class AddFreelancerRefToFreelancerProfile < ActiveRecord::Migration[6.1]
  def change
    add_reference :freelancer_profiles, :freelancer, null: false, foreign_key: true
  end
end
