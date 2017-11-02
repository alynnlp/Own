Rails.application.routes.draw do
    get 'home', to: 'hello_world#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # get 'agent/:id' => 'agent_profile#show'
    resources :agent, controller: :agent_profile
    resources :clientresponse, controller: :client_response

    resources :client, controller: :client_profile
    resources :agentlist, controller: :agent_list
    resources :agentrequest, controller: :agent_request


end
