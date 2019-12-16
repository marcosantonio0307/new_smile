Rails.application.routes.draw do
  root 'procedures#index'

  get 'procedures/:id/reports' => 'procedures#reports', as: :procedure_reports
  put 'procedures/:id/avatar' => 'procedures#avatar', as: :procedure_avatar
  put 'procedures/:id/photos' => 'procedures#photos', as: :procedure_photos
  put 'procedures/:id/raysx' => 'procedures#raysx', as: :procedure_raysx
  put 'procedures/:id/teleraysx' => 'procedures#teleraysx', as: :procedure_teleraysx
  put 'procedures/:id/traceds' => 'procedures#traceds', as: :procedure_traceds
  put 'procedures/:id/usps' => 'procedures#usps', as: :procedure_usps
  delete 'procedures/:id/photos/:photos_id' => 'procedures#purge_photos', as: :purge_photos
  delete 'procedures/:id/raysx/:raysx_id' => 'procedures#purge_raysx', as: :purge_raysx
  delete 'procedures/:id/teleraysx/:teleraysx_id' => 'procedures#purge_teleraysx', as: :purge_teleraysx
  delete 'procedures/:id/traceds/:traceds_id' => 'procedures#purge_traceds', as: :purge_traceds
  delete 'procedures/:id/usps/:usps_id' => 'procedures#purge_usps', as: :purge_usps
  resources :procedures, only:[:new, :create, :edit, :update, :destroy, :show] do
  	resources :works, only:[:new, :create, :edit, :update, :destroy, :show]
  end
end
