FundMe::Application.routes.draw do
  resources :payment_notifications

  resources :donations

  resources :line_items

  resources :carts
  
  root to: "fund_me#main"
  devise_for :users
  resources :kids
  get 'fund_me/main'
  get 'fund_me/edu'
  get 'fund_me/rec'
  get 'fund_me/a'
  get 'fund_me/map'
  get 'fund_me/info'
  get 'fund_me/history'
  get 'fund_me/contact'
  get 'fund_me/nocarts'
  get 'users'=> redirect("fund_me/main")

  post 'carts/remove_from_cart'
  
  # devise_for :users, :controllers => { :sessions => "users/sessions" }
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
