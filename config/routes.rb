Rails.application.routes.draw do
  devise_for :exhibitions, controllers: {sessions: 'exhibitions/sessions', passwords: 'exhibitions/passwords', registrations: 'exhibitions/registrations' }

  devise_for :customers, controllers: {sessions: 'customers/sessions', passwords: 'customers/passwords', registrations: 'customers/registrations' }
  
  get 'items/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
end
