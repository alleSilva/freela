class ProposalsController < ApplicationController
  def create
    @proposal = Proposal.new(
      params.require(:proposal).permit(
        :payment_hour,
        :week_hours,
        :conclusion_date,
        :resume
      )
    )
    @project = Project.find(params[:project_id])
    @proposal.freelancer = current_freelancer
    @proposal.project = @project
    @proposal.project_owner = @project.project_owner
  end

  redirect_to @proposal
end