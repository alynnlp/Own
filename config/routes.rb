Rails.application.routes.draw do
    get 'home', to: 'hello_world#index'
    post '/agent/:id/agentrequest', to: 'agent#create'
    get '/agentlogin', to: 'agent_login#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # get 'agent/:id' => 'agent_profile#show'
    resources :agent, controller: :agent
    resources :clientresponse, controller: :client_response

    resources :agent_profile, controller: :agent_profile
    resources :client_profile, controller: :client_profile

end
