require 'rails_helper'

describe 'project owner views a proposal' do
  it 'successfully' do
    freelancer_a = Freelancer.create!(email: 'freelancera@email.com.br', password: '123456')
    freelancer_b = Freelancer.create!(email: 'freelancerb@email.com.br', password: '123456')
    ale = ProjectOwner.create!(email: 'ale@email.com.br', password: '123456')
    iza = ProjectOwner.create!(email: 'iza@email.com.br', password: '123456')
    project_ale = Project.create!({
        title: "Api de entregas",
        description: "Api para servir de backend para aplicativo",
        skills: "Ruby, SQL, Json",
        max_payment_hour: 100,
        remote: true,
        limit_bid_date: "12/12/2021",
        project_owner: ale
    })

    project_iza = Project.create!({
      title: "Landing Page",
      description: "Landing page para divulgação de venda de produtos importados",
      skills: "html, css, javascript",
      max_payment_hour: 80,
      remote: true,
      limit_bid_date: "12/12/2021",
      project_owner: iza
  })

    proposal_a = Proposal.create!({
      payment_hour: 100,
      week_hours: 30,
      conclusion_date: '01/01/2022',
      resume: 'Trabalho com rapidez e qualidade',
      project: project_ale,
      project_owner: ale,
      freelancer: freelancer_a
    })

    proposal_b = Proposal.create!({
      payment_hour: 90,
      week_hours: 20,
      conclusion_date: '15/01/2022',
      resume: 'Tenho experiência com api',
      project: project_ale,
      project_owner: ale,
      freelancer: freelancer_b
    })

    proposal_c = Proposal.create!({
      payment_hour: 90,
      week_hours: 20,
      conclusion_date: '15/01/2022',
      resume: 'Faço as mais belas Landing Pages',
      project: project_iza,
      project_owner: iza,
      freelancer: freelancer_b
    })

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'
    click_on 'Ver propostas'
    
    expect(page).to have_content('Trabalho com rapidez e qualidade')
    expect(page).to have_content('30')
    expect(page).to have_content('01/01/2022')
    expect(page).to have_content('R$ 100,00')

    expect(page).to have_content('Tenho experiência com api')
    expect(page).to have_content('20')
    expect(page).to have_content('15/01/2022')
    expect(page).to have_content('R$ 90,00')
    expect(page).not_to have_content('Faço as mais belas Landing Pages')
  end

  it 'and accept the proposal' do
    freelancer_a = Freelancer.create!(email: 'freelancera@email.com.br', password: '123456')
    freelancer_b = Freelancer.create!(email: 'freelancerb@email.com.br', password: '123456')
    ale = ProjectOwner.create!(email: 'ale@email.com.br', password: '123456')
    iza = ProjectOwner.create!(email: 'iza@email.com.br', password: '123456')
    project_ale = Project.create!({
        title: "Api de entregas",
        description: "Api para servir de backend para aplicativo",
        skills: "Ruby, SQL, Json",
        max_payment_hour: 100,
        remote: true,
        limit_bid_date: "12/12/2021",
        project_owner: ale
    })

    project_iza = Project.create!({
      title: "Landing Page",
      description: "Landing page para divulgação de venda de produtos importados",
      skills: "html, css, javascript",
      max_payment_hour: 80,
      remote: true,
      limit_bid_date: "12/12/2021",
      project_owner: iza
  })

    proposal_a = Proposal.create!({
      payment_hour: 100,
      week_hours: 30,
      conclusion_date: '01/01/2022',
      resume: 'Trabalho com rapidez e qualidade',
      project: project_ale,
      project_owner: ale,
      freelancer: freelancer_a
    })

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'
    click_on 'Ver propostas'
    click_on 'Aceitar proposta'
    
    expect(page).to have_content('Trabalho com rapidez e qualidade')
    expect(page).to have_content('30')
    expect(page).to have_content('01/01/2022')
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_content('Status: Aprovada')
    expect(page).not_to have_content('Status: Pendente')

  end

  it 'and reject the proposal' do
    freelancer_a = Freelancer.create!(email: 'freelancera@email.com.br', password: '123456')
    freelancer_b = Freelancer.create!(email: 'freelancerb@email.com.br', password: '123456')
    ale = ProjectOwner.create!(email: 'ale@email.com.br', password: '123456')
    iza = ProjectOwner.create!(email: 'iza@email.com.br', password: '123456')
    project_ale = Project.create!({
        title: "Api de entregas",
        description: "Api para servir de backend para aplicativo",
        skills: "Ruby, SQL, Json",
        max_payment_hour: 100,
        remote: true,
        limit_bid_date: "12/12/2021",
        project_owner: ale
    })

    project_iza = Project.create!({
      title: "Landing Page",
      description: "Landing page para divulgação de venda de produtos importados",
      skills: "html, css, javascript",
      max_payment_hour: 80,
      remote: true,
      limit_bid_date: "12/12/2021",
      project_owner: iza
  })

    proposal_a = Proposal.create!({
      payment_hour: 100,
      week_hours: 30,
      conclusion_date: '01/01/2022',
      resume: 'Trabalho com rapidez e qualidade',
      project: project_ale,
      project_owner: ale,
      freelancer: freelancer_a
    })

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'
    click_on 'Ver propostas'
    click_on 'Rejeitar proposta'
    
    expect(page).to have_content('Trabalho com rapidez e qualidade')
    expect(page).to have_content('30')
    expect(page).to have_content('01/01/2022')
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_content('Status: Rejeitada')
    expect(page).not_to have_content('Status: Aprovada')
  end
end