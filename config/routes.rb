Rails.application.routes.draw do
  devise_for :admins
  devise_for :freelancers, controllers: { registrations: 'registrations' }
  devise_for :project_owners

  root to: 'home#index'

  get '/auth/sign_in', to: 'auth#sign_in', as: 'sign_in'
  get '/auth/sign_up', to: 'auth#sign_up', as: 'sign_up'

  resources :projects, only: %i[index show new create] do
    get 'my_projects', on: :collection
    get 'proposals', on: :collection
    get 'search', on: :collection
    resources 'proposals', only: %i[create show index], shallow: true do
      post 'accept', on: :member
      post 'reject', on: :member
    end
  end

  resources :freelancers, only: %i[show new create]
  resources :freelancer_profiles, only: %i[show new create]
  resources :actuation_areas, only: %i[show new create]

  namespace :api do
    namespace :v1 do
      resources :projects, only: [:index]
    end
  end
end
