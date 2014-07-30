Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'

  # Routes for the Tool resource:
  # CREATE
  get('/tools/new', { :controller => 'tools', :action => 'new' })
  get('/create_tool', { :controller => 'tools', :action => 'create' })

  # READ
  get('/tools', { :controller => 'tools', :action => 'index' })
  get('/tools/:id', { :controller => 'tools', :action => 'show' })

  # UPDATE
  get('/tools/:id/edit', { :controller => 'tools', :action => 'edit' })
  get('/update_tool/:id', { :controller => 'tools', :action => 'update' })

  # DELETE
  get('/delete_tool/:id', { :controller => 'tools', :action => 'destroy' })
  #------------------------------

  # Routes for the Membership resource:
  # CREATE
  get('/memberships/new', { :controller => 'memberships', :action => 'new' })
  get('/create_membership', { :controller => 'memberships', :action => 'create' })

  # READ
  get('/memberships', { :controller => 'memberships', :action => 'index' })
  get('/memberships/:id', { :controller => 'memberships', :action => 'show' })

  # UPDATE
  get('/memberships/:id/edit', { :controller => 'memberships', :action => 'edit' })
  get('/update_membership/:id', { :controller => 'memberships', :action => 'update' })

  # DELETE
  get('/delete_membership/:id', { :controller => 'memberships', :action => 'destroy' })
  #------------------------------

  # Routes for the Group resource:
  # CREATE
  get('/groups/new', { :controller => 'groups', :action => 'new' })
  get('/create_group', { :controller => 'groups', :action => 'create' })

  # READ
  get('/groups', { :controller => 'groups', :action => 'index' })
  get('/groups/:id', { :controller => 'groups', :action => 'show' })

  # UPDATE
  get('/groups/:id/edit', { :controller => 'groups', :action => 'edit' })
  get('/update_group/:id', { :controller => 'groups', :action => 'update' })

  # DELETE
  get('/delete_group/:id', { :controller => 'groups', :action => 'destroy' })
  #------------------------------

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
