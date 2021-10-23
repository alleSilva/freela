class ProposalsController < ApplicationController
  def show
    @proposal = Proposal.find(params[:id])
  end

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
    @proposal.save!
  
    redirect_to @proposal, notice: 'Proposta enviada com sucesso'
  end
end