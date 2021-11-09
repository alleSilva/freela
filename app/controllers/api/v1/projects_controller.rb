class Api::V1::ProjectsController < ActionController::API
  def index
    @projects = Project.all
    render json: @projects.as_json(except: [:created_at, :updated_at])
  end
end
