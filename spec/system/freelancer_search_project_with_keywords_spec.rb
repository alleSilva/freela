require 'rails_helper'

describe 'Authenticated Freelancer search projects with especific keywords' do
  limit_date = "#{I18n.l(Date.today.advance({days: 7}))}"

  it 'must be signed in' do
  
    visit root_path
    visit projects_path
    
    expect(page).not_to have_link('Pesquisar')
  end

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
        limit_bid_date: limit_date,
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
        limit_bid_date: limit_date,
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
    expect(page).to have_content("Aplicar até: #{limit_date}")
    expect(page).not_to have_content('Api de entregas')
    #expect(page).to have_content("Projeto publicado por: ale@email.com.br")
  end

  it 'search for a word that not exists in database' do
    #Arrange
    freelancer1 = Freelancer.create!(email: 'freelancer1@email.com.br', password: '123456')
    owner = ProjectOwner.create!(email: 'owner1@email.com.br', password: '123456')
    projeto_a = Project.create!({
        title: "Site institucional",
        description: "Site de escola com várias informações",
        skills: "Javascript, Html, Css",
        max_payment_hour: 50,
        remote: true,
        limit_bid_date: limit_date,
        project_owner: owner
    })

    #Act
    login_as freelancer1, scope: :freelancer
    visit root_path
    click_on 'Ver projetos'
    #click_on 'Entrar e publicar um projeto'

    fill_in :search, with: "banana"

    click_on 'Pesquisar'

    #Assert
    expect(page).to have_content('Nenhum projeto disponível')
    expect(page).not_to have_content('Site institucional')
    expect(page).not_to have_content('Site de escola com várias informações')
    expect(page).not_to have_content("Javascript, Html, Css")
    expect(page).not_to have_content("R$ 50,00")
    expect(page).not_to have_content("Remoto: Sim")
    expect(page).not_to have_content("Aplicar até: #{limit_date}")
  end
end
