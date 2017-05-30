MethodLearner::Application.routes.draw do

  get "/home", to: "application#index"

  root to: 'application#index'

  resources :links_table, except: [:destroy]

end
