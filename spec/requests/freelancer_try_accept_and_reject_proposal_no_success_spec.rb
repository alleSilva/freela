require 'rails_helper'

describe 'Freelancer is authenticated' do
  it 'and cannot accept a proposal' do
    owner = ProjectOwner.create!(email: 'owner@email.com.br', password: '123456')
    freelancer = Freelancer.create!(email: 'freelancer1@email.com.br', password: '123456')
    project = Project.create!({
      title: "Api de entregas",
      description: "Api para servir de backend para aplicativo",
      skills: "Ruby, SQL, Json",
      max_payment_hour: 100,
      remote: true,
      limit_bid_date: 7.day.from_now,
      project_owner: owner
    })

    proposal= Proposal.create!({
      payment_hour: 100,
      week_hours: 30,
      conclusion_date: 20.day.from_now,
      resume: 'Trabalho com rapidez e qualidade',
      project: project,
      project_owner: owner,
      freelancer: freelancer
    })
    
    login_as freelancer, scope: :freelancer
    
    post '/proposals/1/accept'
    
    expect(response).to redirect_to('/project_owners/sign_in')
    expect(response).not_to redirect_to('/proposals/1') 
  end

  it 'and cannot accept a proposal' do
    owner = ProjectOwner.create!(email: 'owner@email.com.br', password: '123456')
    freelancer = Freelancer.create!(email: 'freelancer1@email.com.br', password: '123456')
    project = Project.create!({
      title: "Api de entregas",
      description: "Api para servir de backend para aplicativo",
      skills: "Ruby, SQL, Json",
      max_payment_hour: 100,
      remote: true,
      limit_bid_date: 7.day.from_now,
      project_owner: owner
    })

    proposal= Proposal.create!({
      payment_hour: 100,
      week_hours: 30,
      conclusion_date: 20.day.from_now,
      resume: 'Trabalho com rapidez e qualidade',
      project: project,
      project_owner: owner,
      freelancer: freelancer
    })
    
    login_as freelancer, scope: :freelancer
    
    post '/proposals/1/reject'
    
    expect(response).to redirect_to('/project_owners/sign_in')
    expect(response).not_to redirect_to('/proposals/1') 
  end
end
