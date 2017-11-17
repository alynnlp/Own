Rails.application.routes.draw do
    get '/', to: 'hello_world#index'
    post '/agent/:id/agentrequest', to: 'agent#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # get 'agent/:id' => 'agent_profile#show'
    resources :agent, controller: :agent
    resources :clientresponse, controller: :client_response
    resources :agentlogin, controller: :agent_login
    resources :agent_profile, controller: :agent_profile
    resources :client_profile, controller: :client_profile

end
