require 'rails_helper'

describe 'freelancer makes a proposal' do
  it 'successfully' do
    freelancer = Freelancer.create!(email: 'freelancer@email.com.br', password: '123456')
    owner = ProjectOwner.create!(email: 'owner@email.com.br', password: '123456')
    project = Project.create!({
        title: "Api de entregas",
        description: "Api para servir de backend para aplicativo",
        skills: "Ruby, SQL, Json",
        max_payment_hour: 100,
        remote: true,
        limit_bid_date: "12/10/2021",
        project_owner: owner
    })

    login_as freelancer, scope: :freelancer
    visit root_path
    click_on 'Ver projetos'
    click_on project.title
    fill_in 'Resumo da proposta', with: 'Tenho boa experiência em apis rest com ruby on rails'
    fill_in 'Quantidade de horas por semana', with: '20'
    fill_in 'Valor da hora de trabalho', with: '100'
    fill_in 'Data de conclusão', with: '12/10/2021'
    click_on 'Enviar Proposta'

    expect(page).to have_content('Tenho boa experiência em apis rest com ruby on rails')
    expect(page).to have_content('20')
    expect(page).to have_content('12/10/2021')
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_content('Proposta enviada com sucesso')
    expect(page).to have_content('Status: pending')
  end
end