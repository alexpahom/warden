Rails.application.routes.draw do

  resources :suites do
    resources :sections do
    # get '/sections/new',              to: 'suites#new_section'
    # post '/sections',                 to: 'suites#create_section'
    # get '/sections/:id/edit',         to: 'suites#edit_section',    as: 'edit_section'
    # patch '/sections/:id/',           to: 'suites#update_section'
    # delete '/sections/:id',           to: 'suites#destroy_section'
    end
  end
end