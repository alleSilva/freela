require 'rails_helper'

describe 'Project API' do
  context 'GET /api/v1/projects' do
    it 'should get projects' do
      ale = create(:project_owner)
      iza = create(:project_owner, email: 'iza@mail.com.br')

      project_a = create(
        :project,
        title: 'Api de fastfood',
        description: 'Api para pedidos de fastfood',
        skills: 'ruby, ruby on rails, json',
        project_owner: ale
      )

      project_b = create(
        :project,
        title: 'Loja virtual',
        description: 'Loja virtual com várias opções de pagamento e entrega',
        skills: 'Wordpress, php, html, css',
        project_owner: ale
      )

      get '/api/v1/projects'
      
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(parsed_body.first[:title]).to eq('Api de fastfood')
      expect(parsed_body.second[:title]).to eq('Loja virtual')
      expect(parsed_body.count).to eq(2)
    end
  end
end
