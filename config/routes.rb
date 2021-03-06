Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :leagues do
    resources :teams do
      resources :players
    end
    resources :results
  end

resources :teams
resources :players

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get "teams/:id/buy_item/:item" => "teams#buy_item", as: "buy_item"
  get "teams/:id/sell_item/:item" => "teams#sell_item", as: "sell_item"
  get "teams/:id/toggle_item/:item" => "teams#toggle_item", as: "toggle_item"

  get "teams/:id/finalise" => "teams#finalise", as: "finalise"
  get "teams/:id/undo_finalise" => "teams#undo_finalise", as: "undo_finalise"

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