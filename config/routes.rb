Rails.application.routes.draw do
  devise_for :admins
  devise_for :freelancers, controllers: { registrations: "registrations" }
  devise_for :project_owners

  root to: 'home#index'

  get '/sign_in', to: 'sign_in#index', as: 'sign_in_page'
  get '/sign_up', to: 'sign_up#index', as: 'sign_up_page'
  
  resources :projects, only: [:index, :show, :new, :create] do
    get 'my_projects', on: :collection
    get 'proposals', on: :collection
    get 'search', on: :collection
    resources 'proposals', only: [:create, :show, :index], shallow: true do
      post 'accept', on: :member
      post 'reject', on: :member
    end
  end

  #resources :proposals, only: [:show]
  resources :freelancers, only: [:show, :new, :create]
  resources :freelancer_profiles, only: [:show, :new, :create]
  resources :actuation_areas, only: [:show, :new, :create]
end
