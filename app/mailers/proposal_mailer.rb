class ProposalMailer < ApplicationMailer
  def notify_new_proposal
    @proposal = params[:proposal]
    @owner = @proposal.project.project_owner
    @project = @proposal.project
    mail(
      to: @owner.email,
      from: 'no-reply@freela.com',
      subject: 'Nova proposta para seu projeto'
    )
  end
end