Rails.application.routes.draw do

  resources :suites do
    resources :sections, except: %i(show index)
    resources :cases, except: %i(new index)
  end
end
