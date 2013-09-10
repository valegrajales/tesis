Tesis::Application.routes.draw do

  # Static pages and root
  root to: 'static_pages#home'
  match '/about', to: 'static_pages#about'

  # SourceAnnotationsController
  resources :source_annotations, only: [:new, :create, :show]
  match 'source_annotations/all/:source_id', to: 'source_annotations#all', as: 'source_annotations_all'

  # MettingsController
  resources :meetings, only: [:show, :new, :create, :edit, :update, :destroy]
  match 'meetings/all/:thesis_id', to: 'meetings#all', as: 'meetings_all'

  # SourceController
  resources :sources, only: [:new, :create, :show]
  match 'sources/all/:thesis_id', to: 'sources#all', as: 'sources_all'

  # ProductsControler
  resources :products, only: [:new, :create, :show]
  match 'products/all/:thesis_id', to: 'products#all', as: 'products_all'

  # MeetingAnnotations controller
  resources :meeting_annotations, only: [:new, :create, :show]

  # Theses controller
  resources :theses, only: [:new, :create, :show, :index]

  # Sessions controller
  match '/signin', to: 'sessions#new', via: :get
  match '/signin', to: 'sessions#create', via: :post
  match '/logout', to: 'sessions#destroy', via: :delete
  match '/session_error', to: 'sessions#error'

  # Students controller
  resources :students, only: [:show, :new, :create, :index]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end