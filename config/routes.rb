DataEngineering::Application.routes.draw do
  resources :purchase_files
  root :to => 'purchase_files#index'
end
