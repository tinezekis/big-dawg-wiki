Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'sessions#new'
  resources :users, only: [:new, :create, :show, :index]





  #shows most recent version of article
  get 'articles/:article_title' => 'articles#show_recent', as: :show_recent

  #shows 'top 10' articles on article index
  get 'articles/you_should_read' => 'articles#index'

  #creates a new version for the given article
  get 'articles/:article_title/new_version' => 'versions#new'

  post 'articles/:article_title' => 'versions#create', as: :versions

  #allows you to edit a version that has not been published (if published, encourage them to write a new version),
  get 'articles/:article_title/versions/:id/edit' => 'versions#edit'
  put 'articles/:article_title/versions/:id' =>'versions#update'

  #create a new article
  get 'articles/new' => 'articles#new'
  post 'articles' => 'articles#create'

  #show the category index, show all articles associated with a given category

  get 'categories' => 'categories#index'
  get 'categories/:category_name' => 'categories#show', as: :category_name


  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

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
