class FreelancerProfilesController < ApplicationController
  def new
    @freelancer_profile = FreelancerProfile.new
  end

  def create
    @freelancer_profile = FreelancerProfile.create!(params.require(:freelancer_profile).permit(
      :complete_name,
      :social_name,
      :birth_date,
      :education,
      :description,
      :experience,
    ))
  end
end
