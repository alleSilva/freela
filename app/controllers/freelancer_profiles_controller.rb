class FreelancerProfilesController < ApplicationController
  def show
    @freelancer_profile = FreelancerProfile.find(params[:id])
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

    if @freelancer_profile.save
      redirect_to @freelancer_profile
    else
      render :new
    end
  end
end
