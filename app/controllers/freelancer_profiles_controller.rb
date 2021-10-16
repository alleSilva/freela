class FreelancerProfilesController < ApplicationController
  def show
  end

  def new
    @freelancer_profile = FreelancerProfile.new
  end

  def create
    @freelancer_profile = FreelancerProfile.create!(params.require(:freelancer_profile).permit(
      :name,
      :social_name,
      :birth_date,
      :education,
      :description,
      :experience,
      :image
    ))
  end
end
