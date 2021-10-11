require 'rails_helper'

describe 'Visitor goes to Sign in page' do
  it 'and see login options links' do
    visit root_path

    click_on 'Entrar'

    expect(page).to have_link('Entrar como freelancer', href: new_freelancer_session_path)
    expect(page).to have_link('Entrar e publicar um projeto', href: new_project_owner_session_path)

  end

end
