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

   if @project.save
     redirect_to @project
   else
     render :new
   end
 end
end
