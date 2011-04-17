ActionController::Routing::Routes.draw do |map|

  map.resources :projectiles, :only => [:show, :index]
  map.resources :favorites

  map.root :controller => "projectiles", :action => "index"
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.resources :password_resets, :only => [:new, :create, :edit, :update]
  
  map.register 'register', :controller => 'users', :action => 'new'
  map.resources :users, :only => [:new, :create]

  map.namespace :admin do |admin|
    admin.resources :roles
    admin.resources :users
    admin.resources :projectiles, :only => 'index'
    admin.root :controller => 'projectiles', :action => 'index'
  end

  map.namespace :members do |members|
    members.resources :users, :only => [:show, :edit, :update]
    members.resources :projectiles, 
                      :only => [:edit, :update, :new, :create, :destroy],
                      :collection => { :my_projectiles => :get}
    members.root :controller => 'members', :action => 'index'
  
  end

end
