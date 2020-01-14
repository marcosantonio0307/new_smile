Rails.application.routes.draw do
  root 'procedures#index'

  get 'users/sign_up' => 'procedures#notfound'
  devise_for :users
  get 'procedures/finished' => 'procedures#finished'
  get 'procedures/:id/finish_procedure' => 'procedures#finish_procedure', as: :finish_procedure
  get 'procedures/:id/reports' => 'procedures#reports', as: :procedure_reports
  post 'procedures/:id/avatar' => 'procedures#avatar', as: :procedure_avatar
  post 'procedures/:id/image' => 'procedures#image', as: :procedure_image
  delete 'procedures/:id/image/:category/:image_id' => 'procedures#purge_image', as: :purge_image
  get 'procedures/:id/print' => 'procedures#print'
  resources :procedures, only:[:new, :create, :edit, :update, :destroy, :show] do
  	resources :works, only:[:new, :create, :edit, :update, :destroy, :show]
  end
end
