class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end
 def new
   @project = Project.new
 end

 def create
   @project = Project.new(
     params.require(:project).permit(
       :title,
       :description,
       :skills,
       :max_payment_hour,
       :remote,
       :limit_bid_date
     )
   )

   @project.project_owner = current_project_owner
   
   if @project.save
     redirect_to @project
   else
     render :new
   end
 end

 def my_projects
  @projects = current_project_owner.projects
 end
end
