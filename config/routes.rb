Rails.application.routes.draw do

  root 'application#index'

  get 'login' => 'application#login'
  get 'register' => 'application#register'
  get 'home' => 'application#home'
  get 'admin' => 'application#admin'
  # get 'add' => 'application#add_customer'
  # get 'customer/:id' => 'application#viewcustomer'
  # get 'customer/:id/photos/new' => 'photos#new'
  # post 'customer/:id/photos' => 'photos#create'

  post 'user/login' => 'user#login'
  post 'user/register' => 'user#register'
  get 'logout' => 'user#logout'

  get 'autocomplete_customer_name' => 'customer#autocomplete_customer_name'
  post 'search' => 'customer#search'

  # resources :photos, only: [:new, :create, :destroy]
  get 'customer/:customer_id/photos/gallery' => 'photos#gallery'

  resources :customer, only: [:new, :create, :destroy, :show] do
    resources :photos, only: [:new, :create, :destroy, :show]
  end

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
