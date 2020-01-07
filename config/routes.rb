Rails.application.routes.draw do
  root 'procedures#index'

  get 'users/sign_up' => 'procedures#notfound'
  devise_for :users
  get 'procedures/finished' => 'procedures#finished'
  get 'procedures/:id/finish_procedure' => 'procedures#finish_procedure', as: :finish_procedure
  get 'procedures/:id/reports' => 'procedures#reports', as: :procedure_reports
  post 'procedures/:id/avatar' => 'procedures#avatar', as: :procedure_avatar
  post 'procedures/:id/photos' => 'procedures#photos', as: :procedure_photos
  post 'procedures/:id/raysx' => 'procedures#raysx', as: :procedure_raysx
  post 'procedures/:id/teleraysx' => 'procedures#teleraysx', as: :procedure_teleraysx
  post 'procedures/:id/traceds' => 'procedures#traceds', as: :procedure_traceds
  post 'procedures/:id/usps' => 'procedures#usps', as: :procedure_usps
  delete 'procedures/:id/photos/:photos_id' => 'procedures#purge_photos', as: :purge_photos
  delete 'procedures/:id/raysx/:raysx_id' => 'procedures#purge_raysx', as: :purge_raysx
  delete 'procedures/:id/teleraysx/:teleraysx_id' => 'procedures#purge_teleraysx', as: :purge_teleraysx
  delete 'procedures/:id/traceds/:traceds_id' => 'procedures#purge_traceds', as: :purge_traceds
  delete 'procedures/:id/usps/:usps_id' => 'procedures#purge_usps', as: :purge_usps
  resources :procedures, only:[:new, :create, :edit, :update, :destroy, :show] do
  	resources :works, only:[:new, :create, :edit, :update, :destroy, :show]
  end
end
