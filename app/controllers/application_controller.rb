class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if freelancer_signed_in? && current_freelancer.freelancer_profile.blank?
      new_freelancer_profile_path(current_freelancer.id)
    else
      root_path
    end
  end
end
