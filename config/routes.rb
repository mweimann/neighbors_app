Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'

  get('/update_tool_availability/:id', { :controller => 'tools', :action => 'toggle_availability' })

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

  # Routes for the Group resource:
  # CREATE
  get('/users/new', { :controller => 'users', :action => 'new' })
  get('/create_user', { :controller => 'users', :action => 'create' })

  # READ
  get('/users', { :controller => 'users', :action => 'index' })
  get('/users/:id', { :controller => 'users', :action => 'show' })

  # UPDATE
  get('/users/:id/edit', { :controller => 'users', :action => 'edit' })
  get('/update_user/:id', { :controller => 'users', :action => 'update' })

  # DELETE
  get('/delete_user/:id', { :controller => 'users', :action => 'destroy' })


end
