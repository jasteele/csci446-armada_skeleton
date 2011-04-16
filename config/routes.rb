ActionController::Routing::Routes.draw do |map|

  map.resources :projectiles, :only => [:show, :index]
  map.resources :favorites


  map.resources :projectiles, :only => [:show, :index, :new]

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
    admin.resources :projectiles
    admin.root :controller => 'admin', :action => 'index'
  end

  map.namespace :members do |members|
    members.resources :users, :only => [:show, :edit, :update]
    members.resources :projectiles
    members.root :controller => 'projectiles', :action => 'index'
  end

end
