class ProposalsController < ApplicationController
  before_action :authenticate_users!
  before_action :authenticate_freelancer!, only: [:create]
  before_action :authenticate_project_owner!, only: [:accept, :reject]

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
    
    if @proposal.save
      redirect_to @proposal, notice: 'Proposta enviada com sucesso'
    else
      render [@project, @proposal]
    end
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

  private

  def authenticate_users!
    return if project_owner_signed_in? || freelancer_signed_in?
  
    redirect_to root_path, alert: 'Faça login para ter acesso ao site'
  end
end