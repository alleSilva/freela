module Api
  module V1
    class ProjectsController < ActionController::API
      def index
        @projects = Project.all
        render json: @projects.as_json(except: %i[created_at updated_at])
      end
    end
  end
end
