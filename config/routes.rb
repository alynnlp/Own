Rails.application.routes.draw do
    get '/', to: 'hello_world#index'
    post '/agent/:id/agentrequest', to: 'agent#create'

    post '/acceptclient', to: 'response#create'
    delete '/rejectclient', to: 'response#destroy'

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
