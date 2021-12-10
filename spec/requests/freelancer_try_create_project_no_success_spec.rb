require 'rails_helper'

describe 'Freelancer is authenticated' do
  it 'and cannot open form to create a project' do
    freelancer = Freelancer.create!(email: 'freelancer1@email.com.br', password: '123456')
    login_as freelancer, scope: :freelancer
    get '/projects/new'

    expect(response).not_to redirect_to(new_project_path)
  end
  it 'and cannot create a project' do
    freelancer = Freelancer.create!(email: 'freelancer1@email.com.br', password: '123456')
    login_as freelancer, scope: :freelancer
    post '/projects'

    expect(response).not_to redirect_to(projects_path)
  end
end
