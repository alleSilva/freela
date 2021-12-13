require 'rails_helper'

describe 'Project Owner register project' do
  limit_date = I18n.l(Time.zone.today.advance({ days: 7 })).to_s

  it 'must be signed in' do
    # Act
    visit root_path
    # Assert
    expect(page).not_to have_link('Publicar projeto')
    expect(page).not_to have_link('Meus Projetos')
  end

  it 'successfully' do
    # Arrange
    project_owner = ProjectOwner.create!(email: 'ale@email.com.br', password: '123456')

    # Act
    login_as project_owner, scope: :project_owner
    visit root_path
    click_on 'Publicar projeto'

    fill_in 'Título', with: 'Site institucional'
    fill_in 'Descrição', with: 'Site de escola com várias informações'
    fill_in 'Habilidades', with: 'Javascript, Html, Css'
    fill_in 'Valor máximo da hora a ser paga', with: '50'
    check 'Remoto'
    fill_in 'Aplicar até', with: limit_date
    click_on 'Publicar'

    # Assert
    expect(page).to have_content('Site institucional')
    expect(page).to have_content('Site de escola com várias informações')
    expect(page).to have_content('Javascript, Html, Css')
    expect(page).to have_content('R$ 50,00')
    expect(page).to have_content('Remoto: Sim')
    expect(page).to have_content("Aplicar até: #{limit_date}")
    # expect(page).to have_content("Projeto publicado por: ale@email.com.br")
  end

  it 'and must fill all fields' do
    project_owner = ProjectOwner.create!(email: 'ale@mail.com.br', password: '123456789')

    login_as project_owner, scope: :project_owner
    visit root_path
    click_on 'Publicar projeto'

    click_on 'Publicar'

    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Habilidades não pode ficar em branco')
    expect(page).to have_content('Valor máximo da hora a ser paga não pode ficar em branco')
    expect(page).to have_content('Data limite para aplicação não pode ficar em branco')
    expect(Project.count).to eq(0)
  end
end
