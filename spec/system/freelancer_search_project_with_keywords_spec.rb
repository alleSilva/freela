require 'rails_helper'

describe 'Authenticated Freelancer search projects with especific keywords' do
  it 'successfully' do
    #Arrange
    freelancer1 = Freelancer.create!(email: 'freelancer1@email.com.br', password: '123456')
    owner = ProjectOwner.create!(email: 'owner1@email.com.br', password: '123456')
    projeto_a = Project.create!({
        title: "Site institucional",
        description: "Site de escola com várias informações",
        skills: "Javascript, Html, Css",
        max_payment_hour: 50,
        remote: true,
        limit_bid_date: "02/11/2021",
        project_owner: owner
    })

    freelancer2 = Freelancer.create!(email: 'freelancer2@email.com.br', password: '123456')
    owner = ProjectOwner.create!(email: 'owner2@email.com.br', password: '123456')
    projeto_a = Project.create!({
        title: "Api de entregas",
        description: "Api para servir de backend para aplicativo",
        skills: "Ruby, SQL, Json",
        max_payment_hour: 100,
        remote: true,
        limit_bid_date: "22/01/2021",
        project_owner: owner
    })
      

    #Act
    login_as freelancer1, scope: :freelancer
    visit root_path
    click_on 'Ver projetos'
    #click_on 'Entrar e publicar um projeto'

    fill_in :search, with: "site"

    click_on 'Pesquisar'

    #Assert
    expect(page).to have_content('Site institucional')
    expect(page).to have_content('Site de escola com várias informações')
    expect(page).to have_content("Javascript, Html, Css")
    expect(page).to have_content("R$ 50,00")
    expect(page).to have_content("Remoto: Sim")
    expect(page).to have_content("Aplicar até: 02/11/2021")
    expect(page).not_to have_content('Api de entregas')
    #expect(page).to have_content("Projeto publicado por: ale@email.com.br")
  end

  it 'and must fill all fields' do
    project_owner = ProjectOwner.create!(email: 'ale@mail.com.br', password: '123456789')

    login_as project_owner, scope: :project_owner
    visit root_path
    click_on 'Publicar projeto'
    click_on 'Publicar'

    expect(page).to have_content('não pode ficar em branco')
    #expect(page).to have_content('Título não pode ficar em branco')
    #expect(page).to have_content('Descrição não pode ficar em branco')
    expect(Project.count).to eq(0)
  end

  # TODO: verificar que rooms, daily_rate, bathrooms são maiores que zero
end
