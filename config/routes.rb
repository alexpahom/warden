Rails.application.routes.draw do

  resources :suites do
    resources :sections, except: %i(show index)
    resources :cases, except: %i(index new)
    delete '/cases', to: 'cases#bulk_destroy', as: 'delete_case'
  end
end
