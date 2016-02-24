Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'welcome/index2'
  get 'welcome/popup'
  get 'stories/popupStory'
  get 'stories/read'


  get 'request_friendships/send_request/:recipient' => 'request_friendships#send_request'
  post 'request_friendships/creates' => 'request_friendships#creates'
  get 'request_friendships/deciding_request/:rf/:choice' => 'request_friendships#deciding_request'
  get 'request_friendships/show_pending' => 'request_friendships#show_pending'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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

  #Stories
  resources :stories
=begin
     get "/stories"
     post "/stories"
     delete "/stories"
     get "/stories/:id"
     get "/stories/new"
     get "/stories/:id/edit"
     patch "/stories/:id"
     put "/stories/:id"
=end

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
