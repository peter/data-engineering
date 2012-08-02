DataEngineering::Application.routes.draw do
  resources :purchase_files, only: [:index, :show, :new, :create, :destroy]
  root :to => 'purchase_files#index'
end
