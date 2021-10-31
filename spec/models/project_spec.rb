require 'rails_helper'

RSpec.describe Project, type: :model do
  describe '#valid?' do
    context 'should not be valid' do
      it 'limit bid date is in the past' do
        owner = ProjectOwner.create!(email: 'owner@email.com.br', password: '123456')
        
        project = Project.new({
          title: "Api de entregas",
          description: "Api para servir de backend para aplicativo",
          skills: "Ruby, SQL, Json",
          max_payment_hour: 100,
          remote: true,
          limit_bid_date: I18n.l(Date.yesterday),
          project_owner: owner
        })

        project.valid?

        expect(project.errors[:limit_bid_date]).to include("não pode está em datas passadas")
      end
    end
  end
end
