Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'sessions#new'
  resources :users, only: [:new, :create, :show, :index]


  get 'users/:id/upgrade' => 'users#upgrade', as: :upgrade
  get 'articles/search' => 'articles#search'  # works from a non-article page
  # get 'articles/articles/search' => 'articles#search'  # works from an article page
  # 'articles/search?term=xyz'
  #shows 'top 10' articles on article index
  get 'articles/you_should_read' => 'articles#index'
  #shows most recent version of A SINGLE article

  get 'articles/new' => 'articles#new', as: :new_article
  get 'articles/:article_title' => 'articles#show_recent', as: :show_recent

  delete 'articles/:article_title' => 'articles#destroy', as: :delete_article


  #creates a new version for the given article
  get 'articles/:article_title/new_version' => 'versions#new', as: :new_version

  post 'articles/:article_title' => 'versions#create', as: :versions

  #allows you to edit a version that has not been published (if published, encourage them to write a new version),
  post 'articles/:article_title/versions/:id' =>'versions#update', as: :version
  get 'articles/:article_title/versions/:id/edit' => 'versions#edit'


  get 'articles/:article_title/versions/:id' => 'versions#show'
  get 'articles/:article_title/versions/:id/publish' => 'versions#publish'

  #create a new article

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
