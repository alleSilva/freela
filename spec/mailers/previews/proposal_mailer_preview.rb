class ProposalMailerPreview < ActionMailer::Preview
  def notify_new_proposal
    proposal = Proposal.first
    ProposalMailer.with(proposal: proposal).notify_new_proposal
  end
end
