Rails.application.routes.draw do

  resources :suites do
    resources :sections, except: %i(show index)
    resources :cases, except: %i(index)
  end
end
