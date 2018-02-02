Rails.application.routes.draw do

  resources :suites do
    resources :sections, except: %i(show index)
  end
end
