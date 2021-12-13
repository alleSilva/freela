require 'rails_helper'

describe 'project owner views a proposal' do
  conclusion_date = I18n.l(Time.zone.today.advance({ days: 30 })).to_s
  it 'must be signed in' do
    visit root_path

    expect(page).not_to have_link('Publicar projeto')
    expect(page).not_to have_link('Meus Projetos')
  end

  it 'successfully' do
    freelancer_a = create(:freelancer, email: 'freelancera@email.com.br')
    freelancer_b = create(:freelancer, email: 'freelancerb@email.com.br')
    ale = create(:project_owner)
    iza = create(:project_owner, email: 'iza@email.com.br')

    project_ale = create(
      :project,
      title: 'Api de entregas',
      description: 'Api para servir de backend para aplicativo',
      skills: 'Ruby, SQL, Json',
      project_owner: ale
    )

    login_as freelancer_a, scope: :freelancer

    project_iza = create(
      :project,
      title: 'Landing Page',
      description: 'Landing page para divulgação de venda de produtos importados',
      skills: 'html, css, javascript',
      project_owner: iza
    )

    _proposal_a = create(
      :proposal,
      resume: 'Trabalho com rapidez e qualidade',
      project: project_ale,
      project_owner: ale,
      freelancer: freelancer_a
    )

    login_as freelancer_b, scope: :freelancer
    _proposal_b = create(
      :proposal,
      resume: 'Tenho experiência com api',
      project: project_ale,
      project_owner: ale,
      freelancer: freelancer_b
    )

    _proposal_c = create(
      :proposal,
      resume: 'Faço as mais belas Landing Pages',
      project: project_iza,
      project_owner: iza,
      freelancer: freelancer_b
    )

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'
    click_on 'Ver propostas'

    expect(page).to have_content('Trabalho com rapidez e qualidade')
    expect(page).to have_content('30')
    expect(page).to have_content(conclusion_date)
    expect(page).to have_content('R$ 100,00')

    expect(page).to have_content('Tenho experiência com api')
    expect(page).to have_content('20')
    expect(page).to have_content(conclusion_date)
    expect(page).to have_content('R$ 100,00')
    expect(page).not_to have_content('Faço as mais belas Landing Pages')
  end

  it 'and accept the proposal' do
    freelancer_a = create(:freelancer, email: 'freelancera@email.com.br')
    _freelancer_b = create(:freelancer, email: 'freelancerb@email.com.br')
    ale = create(:project_owner, email: 'ale@email.com.br')
    iza = create(:project_owner, email: 'iza@email.com.br')
    project_ale = create(
      :project,
      title: 'Api de entregas',
      description: 'Api para servir de backend para aplicativo',
      skills: 'Ruby, SQL, Json',
      project_owner: ale
    )

    _project_iza = create(
      :project,
      title: 'Landing Page',
      description: 'Landing page para divulgação de venda de produtos importados',
      skills: 'html, css, javascript',
      project_owner: iza
    )

    _proposal_a = create(
      :proposal,
      resume: 'Trabalho com rapidez e qualidade',
      project: project_ale,
      project_owner: ale,
      freelancer: freelancer_a
    )

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'
    click_on 'Ver propostas'
    click_on 'Aceitar proposta'

    expect(page).to have_content('Trabalho com rapidez e qualidade')
    expect(page).to have_content('30')
    expect(page).to have_content(conclusion_date)
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_content('Status: Aprovada')
    expect(page).not_to have_content('Status: Pendente')
  end

  it 'and reject the proposal' do
    freelancer_a = create(:freelancer, email: 'freelancera@email.com.br')
    _freelancer_b = create(:freelancer, email: 'freelancerb@email.com.br')
    ale = create(:project_owner)
    iza = create(:project_owner, email: 'iza@email.com.br')

    project_ale = create(
      :project,
      title: 'Api de entregas',
      description: 'Api para servir de backend para aplicativo',
      skills: 'Ruby, SQL, Json',
      project_owner: ale
    )

    _project_iza = create(
      :project,
      title: 'Landing Page',
      description: 'Landing page para divulgação de venda de produtos importados',
      skills: 'html, css, javascript',
      project_owner: iza
    )

    _proposal_a = create(
      :proposal,
      resume: 'Trabalho com rapidez e qualidade',
      project: project_ale,
      project_owner: ale,
      freelancer: freelancer_a
    )

    login_as ale, scope: :project_owner
    visit root_path
    click_on 'Meus Projetos'
    click_on 'Ver propostas'
    click_on 'Rejeitar proposta'

    expect(page).to have_content('Trabalho com rapidez e qualidade')
    expect(page).to have_content('30')
    expect(page).to have_content(conclusion_date)
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_content('Status: Rejeitada')
    expect(page).not_to have_content('Status: Aprovada')
  end
end
