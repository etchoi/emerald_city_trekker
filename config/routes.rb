Rails.application.routes.draw do

  root 'session#index'
  post '/user/user_login' => 'user#user_login'
  post '/provider/provider_login' => 'provider#provider_login'
  post '/reservation/destroy/:id' => 'reservation#destroy'
  post '/reservation/reserve/:id' => 'reservation#reserve'
  patch 'tour/pic/:id' => 'tour#update_pic'
  get '/user/destroy' => 'user#destroy'
  get '/provider/destroy' => 'provider#destroy'
  get '/tour/destroy/:id' => 'tour#destroy'
  get '/review/new/:id' => 'review#new'
  resources :session
  resources :user
  resources :reservation
  resources :provider
  resources :tour
  resources :review

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
