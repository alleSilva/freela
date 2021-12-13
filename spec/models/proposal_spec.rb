require 'rails_helper'

RSpec.describe Proposal, type: :model do
  describe '#valid?' do
    context 'should not be valid' do
      it 'date of conclusion is lower than date bid limit' do
        freelancer = Freelancer.create!(email: 'freelancer@email.com.br', password: '123456')
        owner = ProjectOwner.create!(email: 'owner@email.com.br', password: '123456')

        project = Project.create!({
                                    title: 'Api de entregas',
                                    description: 'Api para servir de backend para aplicativo',
                                    skills: 'Ruby, SQL, Json',
                                    max_payment_hour: 100,
                                    remote: true,
                                    limit_bid_date: 7.days.from_now,
                                    project_owner: owner
                                  })

        proposal = Proposal.new({
                                  payment_hour: 100,
                                  week_hours: 30,
                                  conclusion_date: 5.days.from_now,
                                  resume: 'Trabalho com rapidez e qualidade',
                                  project: project,
                                  project_owner: owner,
                                  freelancer: freelancer
                                })

        proposal.valid?

        expect(proposal.errors[:conclusion_date]).to include('não pode ser menor que a data de aplicação')
      end
    end
  end
end
