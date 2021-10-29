require 'rails_helper'

describe 'User is not authenticated' do
  it 'and cannot open form to create a project' do
    get '/projects/new'

    expect(response).to redirect_to(root_path) 
  end
  it 'and cannot create a project' do
    post '/projects'

    expect(response).to redirect_to(root_path) 
  end
end
