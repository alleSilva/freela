Rails.application.routes.draw do
  devise_for :admins
  devise_for :freelancers
  devise_for :project_owners
  root to: 'home#index'
end
