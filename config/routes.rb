Rails.application.routes.draw do


  resources :users, only: [:new, :create]
    resource :session, only: [:new, :create, :destroy]

  get '/login' => 'sessions#new'
  get '/register' => 'users#new'
  get '/logout' => 'session#destroy'


  resources :questions do
    resource :votes, only: [:create]
    resources :responses, only: [:create, :edit, :destroy]
    resources :answers, only: [:create, :edit, :destroy, :update] do
      resource :votes, only: [:create]
    end
  end
  resources :answers, only:[] do
    member do
      patch :mark_best_answer
    end
    resources :responses, only: [:create, :edit, :destroy]

  end

  resource :index, only: [:index]

  resources :tags, only: [:create]

  get 'auth/:provider/callback', to: "sessions#create"
  delete 'sign_out', to: "sessions#destroy", as: 'sign_out'

  root to: "index#index"

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

