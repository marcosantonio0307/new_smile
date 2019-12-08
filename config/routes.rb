Rails.application.routes.draw do
  root 'procedures#index'

  resources :procedures, only:[:new, :create, :edit, :update, :destroy, :show]
end
