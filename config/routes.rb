Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'pages#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'test_exception_notification' => 'application#test_exception_notification'
  get 'login' => 'sessions#login'
  post 'auth' => 'sessions#authenticate'
  get 'logout' => 'sessions#logout'
  get 'account' => 'users#account'
  get 'your_sales' => 'sales#your_sales'
  get 'request_password' => 'users#request_password'
  post 'reset_password' => 'users#reset_password'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  get 'store/:id' => 'stores#show'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :users
  resources :ratings
  resources :feedbacks
  resources :stores, :constraints => { :subdomain => "store" }
  resources :interests do
    member do
      get 'delete'
      get 'matching_sales'
    end
  end
  resources :sales do
    member do
      get 'sold'
      get 'unsold'
      get 'report_sold'
      get 'report_breaking_rules'
    end
  end

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
