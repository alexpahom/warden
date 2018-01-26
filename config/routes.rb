Rails.application.routes.draw do

  resources :suites do
    get '/sections/new', to: 'suites#new_section'
    post '/sections', to: 'suites#create_section'
  end
end
