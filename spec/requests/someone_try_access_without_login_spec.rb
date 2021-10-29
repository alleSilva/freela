require 'rails_helper'

describe 'User is not authenticated' do
  it 'and cannot open form to create a project' do
    get '/projects/new'

    expect(response).not_to redirect_to(new_project_path) 
  end
  it 'and cannot create a project' do
    post '/projects'

    expect(response).not_to redirect_to(projects_path) 
  end
end
