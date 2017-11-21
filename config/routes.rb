Rails.application.routes.draw do
    get '/', to: 'hello_world#index'
    post '/agent/:id/agentrequest', to: 'agent#create'
    resources :clientresponse, controller: :client_response



    get '/agent_login', to: 'agent_session#new'
    post '/agent_login', to: 'agent_session#create'
    delete '/agent_logout', to: 'agent_session#destroy'
    get '/agent_register', to:'agent_register#new'
      resources :agent_profile, controller: :agent_profile


    get '/user_login', to: 'user_session#new'
    post '/user_login', to: 'user_session#create'
    delete '/user_logout', to: 'user_session#destroy'
    get '/user_register', to:'user_register#new'
      resources :user_profile, controller: :user_profile





end
