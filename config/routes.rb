Rails.application.routes.draw do

  get 'connections/search'

  get 'membership_cards/exchange'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #############################
  # Rutas para error_controller
  #############################
  match "/404", :to => "errors#not_found", :via => :all
  match "/423", :to => "errors#permission_denied", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  match "/503", :to => "errors#service_down", :via => :all
  # error pages
  # config/routes.rb
  #%w( 404 422 500 ).each do |code|
  #  get code, :to => "errors#show", :code => code
  #end

  devise_for :user
  ##########################################################################
  ###Rutas añadidas por devise####
  #new_user_session_path	        GET	/users/sign_in(.:format)	      devise/sessions#new
  #user_session_path	            POST	/users/sign_in(.:format)  	  devise/sessions#create
  #destroy_user_session_path      DELETE	/users/sign_out(.:format)	  devise/sessions#destroy
  #user_password_path	            POST	/users/password(.:format)	    devise/passwords#create
  #new_user_password_path	        GET	/users/password/new(.:format)	  devise/passwords#new
  #edit_user_password_path	      GET	/users/password/edit(.:format)	devise/passwords#edit
  #                               PATCH	/users/password(.:format)   	devise/passwords#update
  #                               PUT	/users/password(.:format)	      devise/passwords#update
  #cancel_user_registration_path	GET	/users/cancel(.:format)	        devise/registrations#cancel
  #user_registration_path	        POST	/users(.:format)	            devise/registrations#create
  #new_user_registration_path    	GET	/users/sign_up(.:format)	      devise/registrations#new
  #edit_user_registration_path   	GET	/users/edit(.:format)	          devise/registrations#edit
  #                               PATCH	/users(.:format)	            devise/registrations#update
  #                               PUT	/users(.:format)	              devise/registrations#update
  #                               DELETE	/users(.:format)          	devise/registrations#destroy
  #########################################################################

  get 'welcome/index'
  get 'welcome/maker/:id' => 'maker#show'
  get 'welcome/maker2'
  get 'welcome/maker3'
  get 'welcome/maker4'
  get 'welcome/maker5'
  get 'welcome/maker6'
  get 'welcome/maker_fuken'
  get 'welcome/maker2pruebaJulio'
  get 'welcome/textoDesplegable'

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  #categories
  resources :categories

  #peticiones de amistad
  resource :request_friendships
  get 'request_friendships/send_request/:recipient', to: 'request_friendships#send_request'
  post 'request_friendships/creates', to: 'request_friendships#creates'
  get 'request_friendships/deciding_request/:rf/:choice', to: 'request_friendships#deciding_request'
  get 'request_friendships/show_pending', to: 'request_friendships#show_pending'
  get 'request_friendships/cancel_friendship', to: 'request_friendships#cancel_friendship'

  #Stories
  get 'stories/read'
  get 'stories/read/:id' => 'stories#dbread' # read from DB
  get 'stories/example' => 'stories#example' # Caperucita Roja
  get 'stories/acquired' => 'stories#acquired'
  get 'stories/created' => 'stories#created'
  get 'stories/search', to: 'stories#search'
  resources :stories

  #Chapters
  get 'chapters/:id' => 'chapters#show'
  post 'chapters' => 'chapters#create'

  #Profiles
  get 'profiles/search', to: 'profiles#search'
  get 'profiles/premium/:id', to: 'profiles#premium'
  get 'profiles/follow/:id', to: 'profiles#follow'
  get 'profiles/unfollow/:id', to: 'profiles#unfollow'
  get 'profiles/ban/:id', to: 'profiles#ban'
  resources :profiles

  #Additions
  get 'additions/create/:story_id' => 'additions#create'
  delete 'additions' => 'additions#delete'

  #Comments
  get 'comments/new/:id', to: 'comments#new'
  resources :comments

  post 'membership_cards/exchange', to: 'membership_cards#exchange'
  get 'membership_cards/exchange', to: 'membership_cards#exchange'

  get 'connections/search', to: 'connections#search'
  get 'connections/index', to: 'connections#search'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
