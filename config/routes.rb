Rails.application.routes.draw do

  get '/suites',                to: 'suites#index'
  get '/suites/new',            to: 'suites#new'
  get '/suites/:id',            to: 'suites#show', as: 'suite_edit'
  get '/suites/:id/edit',       to: 'suites#edit', as: 'suite'
  post '/suites',               to: 'suites#create'
  patch '/suites/:id/edit',     to: 'suites#update'
end
