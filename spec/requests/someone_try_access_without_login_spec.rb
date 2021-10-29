require 'rails_helper'

describe 'User is not authenticated' do
  it 'and cannot open form to create a project' do
    get '/projects/new'

    expect(response).to redirect_to(new_project_owner_session_path) 
  end
  it 'and cannot create a project' do
    post '/projects'

    expect(response).to redirect_to(new_project_owner_session_path) 
  end
end
