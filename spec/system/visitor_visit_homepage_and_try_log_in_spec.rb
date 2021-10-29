require 'rails_helper'

describe 'Visitor visit homepage' do
  it 'successfully' do
    visit root_path

    expect(page).to have_content('Freela')
    expect(page).to have_css('h3', text: 'Boas vindas ao sistema de contratação de frelancers')
    expect(page).to have_link('Cadastre-se')
    expect(page).to have_link('Entrar')
  end

  it 'and try to login as project owner' do
    visit root_path
    click_on 'Entrar'
    click_on 'Entrar e publicar um projeto'

    expect(page).to have_content('Freela')
    expect(page).to have_content('Entrar no Freela')
    expect(page).not_to have_link('Entrar como freelancer')
  end

  it 'and try to login as freelancer' do
    visit root_path
    click_on 'Entrar'
    click_on 'Entrar como freelancer'

    expect(page).to have_content('Freela')
    expect(page).to have_content('Entrar no Freela')
    expect(page).not_to have_link('Entrar e publicar um projeto')
  end
end
