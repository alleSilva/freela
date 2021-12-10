class FreelancerProfilesController < ApplicationController
  before_action :authenticate_users!
  before_action :authenticate_freelancer!, only: %i[new create]

  def show
    @freelancer_profile = FreelancerProfile.find(params[:id])
  end

  def new
    @freelancer_profile = FreelancerProfile.new
  end

  def create
    @freelancer_profile = FreelancerProfile.new(freelancer_profile_params)

    @freelancer_profile.freelancer = current_freelancer
    if @freelancer_profile.save
      redirect_to @freelancer_profile
    else
      render :new
    end
  end

  def authenticate_users!
    return if project_owner_signed_in? || freelancer_signed_in?

    redirect_to root_path, alert: 'Faça login para ter acesso ao site'
  end

  def freelancer_profile_params
    params.require(:freelancer_profile).permit(
      :name,
      :social_name,
      :birth_date,
      :education,
      :description,
      :experience,
      :image,
      :actuation_area_id
    )
  end
end
