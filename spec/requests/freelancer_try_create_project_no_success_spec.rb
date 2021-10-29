require 'rails_helper'

describe 'Freelancer is authenticated' do
  it 'and cannot open form to create a project' do
    freelancer = Freelancer.create!(email: 'freelancer1@email.com.br', password: '123456')
    login_as freelancer, scope: :freelancer
    get '/projects/new'

    expect(response).to redirect_to(new_project_owner_session_path) 
  end
  it 'and cannot create a project' do
    freelancer = Freelancer.create!(email: 'freelancer1@email.com.br', password: '123456')
    login_as freelancer, scope: :freelancer
    post '/projects'

    expect(response).to redirect_to(new_project_owner_session_path) 
  end
end
