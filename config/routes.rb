Rails.application.routes.draw do

  get '/suites',       to: 'suites#index'
  get '/suites/new',   to: 'suites#new'
end
