Rails.application.routes.draw do
  get '/', to: 'hello_world#index', as: 'root'

    resources :response, controller: :response
    post '/response/:user_id', to: 'response#create', as: 'client_response'
    get '/response/:user_id/new', to: 'response#new', as: 'new_client_response'

    resources :message, controller: :message
    post '/message/:agent_id', to: 'message#create', as: 'agent_message'

    get '/agent_login', to: 'agent_session#new'
    post '/agent_login', to: 'agent_session#create'
    delete '/agent_logout', to: 'agent_session#destroy'
    get '/agent_register', to:'agent_register#new'
    post '/agent_register', to:'agent_register#create'

      resources :agent_profile, controller: :agent_profile

    get '/user_login', to: 'user_session#new'
    post '/user_login', to: 'user_session#create'
    delete '/user_logout', to: 'user_session#destroy'
    get '/user_register', to:'user_register#new'
    post '/user_register', to:'user_register#create'
      resources :user_profile, controller: :user_profile
      resources :agent, controller: :agent


end
