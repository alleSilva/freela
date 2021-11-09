class Api::V1::ProjectsController < ActionController::API
  def index
    @projects = Project.all
  end
end