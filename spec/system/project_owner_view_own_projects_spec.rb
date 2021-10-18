require 'rails_helper'

describe 'Project owner view own projects' do
  it 'using link' do
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
       limit_bid_date: '01/11/2021',
       project_owner: ale
    })

    iza_project = Project.create!({
       title: 'Ruby on rails api',
       description: 'api to serve app',
       skills: 'ruby, ruby on rails, json',
       max_payment_hour: 100,
       remote: true,
       limit_bid_date: '01/12/2021',
       project_owner: iza
    })

  
    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'


    expect(page).to have_content 'Landing Page'
    expect(page).not_to have_content 'Ruby on rails api'
  end

  it 'and has no properties yet' do
    ale = ProjectOwner.create!(email: 'ale@mail.com.br', password: '123456')

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'

    expect(page).to have_content 'Você ainda não tem projetos'
    expect(page).to have_link('Cadastre seu primeiro projeto agora', href: new_project_path)
  end
end
