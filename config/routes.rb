Rails.application.routes.draw do

  resources :users
  get '/without_team', to: 'users#without'
  post '/create_team', to: 'users#start_team'
  post '/join_team', to: 'users#join_team'
  
  resources :team
  post 'leave_team', to: 'team#leave'
  
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  post 'logout', to: 'session#destroy'
  
  resources :admins
  get 'approve_team', to: 'admins#approve'
  get 'disapprove_team', to: 'admins#disapprove'
  
  get 'download_team_info', to: "file#team_info_txt"
  post 'upload_discussions', to: 'file#upload_discussions_txt'
  
  post '/admin/email', to: "admins#test_email", as: 'admins_email'
  
  root 'session#new'

  # TODO: something for route not found
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase


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
