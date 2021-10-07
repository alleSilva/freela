require 'rails_helper'

describe 'Visitor visit homepage' do
  it 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'Freela')
    expect(page).to have_css('h3', text: 'Boas vindas ao sistema de contratação de frelancers')
    expect(page).to have_link('Cadastre-se')
    expect(page).to have_link('Entrar')

  end
end
