Rails.application.routes.draw do
  
  root :to => "nambi#index"
  match ":controller(/:action(/:id))", :via => [:post, :get]
end
