class ProposalsController < ApplicationController
  def show
    @proposal = Proposal.find(params[:id])
  end

  def index
    project = Project.find(params[:project_id])
    @proposals = project.proposals.all
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

  def accept
    @proposal = Proposal.find(params[:id])
    @proposal.accepted!
    redirect_to @proposal
  end

  def reject
    @proposal = Proposal.find(params[:id])
    @proposal.rejected!
    redirect_to @proposal
  end
end