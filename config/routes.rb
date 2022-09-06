Rails.application.routes.draw do
  get '/projects/:id', to: 'projects#show'
  
  patch 'projects/:id', to: 'contestant_project#create'

  get '/contestants', to: 'contestants#index'
  
end
