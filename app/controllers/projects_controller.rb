class ProjectsController < ApplicationController
  def index
    @projects = Project.search(params[:search])

  end
  def show
    @project = Project.find(params[:id])
    @proposal = Proposal.new
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

 def project_proposals
  project = Project.find(current_project_owner.id)
  @proposals = current_project_owner.projects.find(project.id)
 end

  def search
    @projects = Project.search(params[:search])

  end
end
