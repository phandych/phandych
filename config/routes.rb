Rails.application.routes.draw do
  root 'frontend/pages#home'
  
  resources :users, only: [:show], module: 'frontend'

  resources :account_activations, only: [:edit], module: 'frontend'

  resources :password_resets, only: [:new, :create, :edit, :update], module: 'frontend'

  namespace :admin do
    root 'pages#index'

    get 'login' => 'sessions#new'

    post 'login' => 'sessions#create'

    delete 'logout' => 'sessions#destroy'

    resources :categories, only: [:index, :new, :create, :edit, :update]
    
    resources :products, only: [:index, :new, :create, :edit, :update]
  end


  get 'signup' => 'frontend/users#new'
  
  post 'signup' => 'frontend/users#create'

  get 'login' => 'frontend/sessions#new'
  
  post 'login' => 'frontend/sessions#create'

  delete 'logout' => 'frontend/sessions#destroy'

  get 'auth/:provider/callback', to: 'frontend/sessions#social'

  get 'auth/failure', to: redirect('/')



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
