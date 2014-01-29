Rantcat::Application.routes.draw do
  get "/posts", to: "posts#index", as: :home
  get "users/new"
  get "users/edit"
  get "users/show"
  get "sessions/new"
  get "sessions/create"
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/signin', to: 'users#new', via: 'get'
  # match '/users/:id', to: 'users#show', via: 'get'
  # post 'posts/index', to: 'posts#create', as: :posts
  post 'users/show', to: 'posts#create', as: :user_posts
  # post 'users/show', to: 'users#show', as: :userposts
resources :users, except: [:destroy]

resources :posts, shallow: true do
  resources :posts
end
# resources :posts
resources :sessions, except: [:destroy]

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