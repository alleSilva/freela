require 'rails_helper'

describe 'Project owner view own projects' do
  limit_date = "#{I18n.l Date.today.advance({days: 7})}"

  it 'must be signed in' do
    # Act 
    visit root_path
    # Assert
    expect(page).not_to have_link('Publicar projeto')
    expect(page).not_to have_link('Meus Projetos')
  end

  it 'using link Meus projetos' do
    project_owner = ProjectOwner.create!(email: 'ale@email.com.br', password: '123456')
  
    login_as project_owner, scope: :project_owner
    visit root_path

    expect(page).to have_link('Meus Projetos', href: my_projects_projects_path)
  end

  it 'and should view owned projects' do
   
    ale = ProjectOwner.create!(email: 'ale@mail.com.br', password: '123456')
    iza = ProjectOwner.create!(email: 'iza@mail.com.br', password: '123456')

    ale_project = Project.create!({
       title: 'Landing Page',
       description: 'Landing page para promoção e venda de produtos de beleza',
       skills: 'html, css, javascript',
       max_payment_hour: 50,
       remote: true,
       limit_bid_date: limit_date,
       project_owner: ale
    })

    iza_project = Project.create!({
       title: 'Ruby on rails api',
       description: 'api to serve app',
       skills: 'ruby, ruby on rails, json',
       max_payment_hour: 100,
       remote: true,
       limit_bid_date: limit_date,
       project_owner: iza
    })

  
    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'


    expect(page).to have_content 'Landing Page'
    expect(page).not_to have_content 'Ruby on rails api'
    expect(page).not_to have_content('Resumo da proposta')
  end

  it 'and has no projects yet' do
    ale = ProjectOwner.create!(email: 'ale@mail.com.br', password: '123456')

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'

    expect(page).to have_content 'Você ainda não tem projetos'
    expect(page).to have_link('Cadastre seu primeiro projeto agora', href: new_project_path)
  end

  it 'using link' do
    project_owner = ProjectOwner.create!(email: 'ale@email.com.br', password: '123456')
  
    login_as project_owner, scope: :project_owner
    visit root_path

    expect(page).to have_link('Meus Projetos', href: my_projects_projects_path)
  end

  it 'and should view a proposal' do
    freelancer = Freelancer.create!(email: 'ale@mail.com.br', password: '123456')
    ale = ProjectOwner.create!(email: 'ale@mail.com.br', password: '123456')
    iza = ProjectOwner.create!(email: 'iza@mail.com.br', password: '123456')

    ale_project = Project.create!({
       title: 'Landing Page',
       description: 'Landing page para promoção e venda de produtos de beleza',
       skills: 'html, css, javascript',
       max_payment_hour: 50,
       remote: true,
       limit_bid_date: limit_date,
       project_owner: ale
    })

    iza_project = Project.create!({
       title: 'Ruby on rails api',
       description: 'api to serve app',
       skills: 'ruby, ruby on rails, json',
       max_payment_hour: 100,
       remote: true,
       limit_bid_date: limit_date,
       project_owner: iza
    })

    proposal = Proposal.create!({
      payment_hour: 100,
      week_hours: 30,
      conclusion_date: '01/01/2022',
      resume: 'Tenho experiência com sites',
      project: ale_project,
      project_owner: ale,
      freelancer: freelancer
    })
  
    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'


    expect(page).to have_content 'Landing Page'
    expect(page).not_to have_content 'Ruby on rails api'
    expect(page).not_to have_content('Resumo da proposta')
    expect(page).to have_link 'Ver propostas'
  end
  
end
