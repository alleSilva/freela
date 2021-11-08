require "rails_helper"

RSpec.describe ProposalMailer, type: :mailer do
  context 'new proposal' do
    it 'should notify project owner' do
      freelancer = create(:freelancer)
      project_owner = create(:project_owner)
       
      project = create(
        :project,
        title: "Api de entregas",
        description: "Api para servir de backend para aplicativo",
        skills: "Ruby, SQL, Json",
        project_owner: project_owner
      )
      
      login_as freelancer, scope: :freelancer
      
      proposal = create(
        :proposal,
        resume: 'Trabalho com rapidez e qualidade',
        project: project,
        project_owner: project_owner,
        freelancer: freelancer
      )

      mail = ProposalMailer.with(proposal: proposal).notify_new_proposal()

      expect(mail.to).to eq ['ale@email.com']
      expect(mail.from).to eq ['no-reply@freela.com']
      expect(mail.subject).to eq 'Nova proposta para seu projeto'
      expect(mail.body).to include 'Seu projeto Api de entregas recebeu uma proposta de ale@email.com'
    end
  end
end