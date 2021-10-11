require 'rails_helper'

describe 'Visitor goes to Sign up page' do
  it 'and see links to Sign up' do
    visit root_path

    click_on 'Cadastre-se'

    expect(page).to have_link('Cadastre-se como freelancer', href: new_freelancer_registration_path)
    expect(page).to have_link('Cadastre-se e publique um projeto', href: new_project_owner_registration_path)

  end

end
