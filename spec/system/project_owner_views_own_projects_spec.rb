require 'rails_helper'

describe 'Project owner view own projects' do
  it 'must be signed in' do
    visit root_path

    expect(page).not_to have_link('Publicar projeto')
    expect(page).not_to have_link('Meus Projetos')
  end

  it 'using link Meus projetos' do
    project_owner = create(:project_owner)

    login_as project_owner, scope: :project_owner
    visit root_path

    expect(page).to have_link('Meus Projetos', href: my_projects_projects_path)
  end

  it 'and should view owned projects' do
    ale = create(:project_owner)
    iza = create(:project_owner, email: 'iza@mail.com.br')

    _ale_project = create(:project, project_owner: ale)

    _iza_project = create(
      :project,
      title: 'Ruby on rails api',
      description: 'api to serve app',
      skills: 'ruby, ruby on rails, json',
      project_owner: iza
    )

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'

    expect(page).to have_content 'Loja virtual'
    expect(page).not_to have_content 'Ruby on rails api'
    expect(page).not_to have_content('Resumo da proposta')
  end

  it 'and has no projects yet' do
    ale = create(:project_owner)

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'

    expect(page).to have_content 'Você ainda não tem projetos'
    expect(page).to have_link('Cadastre seu primeiro projeto agora', href: new_project_path)
  end

  it 'using link' do
    project_owner = create(:project_owner)

    login_as project_owner, scope: :project_owner
    visit root_path

    expect(page).to have_link('Meus Projetos', href: my_projects_projects_path)
  end

  it 'and should view a proposal' do
    freelancer = create(:freelancer)
    ale = create(:project_owner)
    iza = create(:project_owner, email: 'iza@mail.com.br')

    ale_project = create(
      :project,
      title: 'Landing Page',
      description: 'Landing page para promoção e venda de produtos de beleza',
      skills: 'html, css, javascript',
      project_owner: ale
    )

    _iza_project = create(
      :project,
      title: 'Ruby on rails api',
      description: 'api to serve app',
      skills: 'ruby, ruby on rails, json',
      project_owner: iza
    )

    _proposal = create(
      :proposal,
      resume: 'Tenho experiência com sites',
      project: ale_project,
      project_owner: ale,
      freelancer: freelancer
    )

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'

    expect(page).to have_content 'Landing Page'
    expect(page).not_to have_content 'Ruby on rails api'
    expect(page).not_to have_content('Resumo da proposta')
    expect(page).to have_link 'Ver propostas'
  end
end
