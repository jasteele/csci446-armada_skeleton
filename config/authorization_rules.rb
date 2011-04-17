# Using declarative_authorization.
authorization do
  role :guest do
    has_permission_on :projectiles, :to => :read
  end
  role :member do
    has_permission_on :members_members, :to => :read
    has_permission_on :members_projectiles, :to => :read
    has_permission_on :members_projectiles, :to => [:update, :delete] do
      if_attribute :user => is {user}
    end
  end
  role :administrator do
    has_permission_on :admin_admin, :to => :read
    has_permission_on :admin_users, :to => :manage
    has_permission_on :admin_roles, :to => :manage
    has_permission_on :admin_projectiles, :to => :manage
    has_permission_on :members_projectiles, :to => :manage
  end
  role :developer do
    includes :administrator
  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => [:edit]
  privilege :delete, :includes => :destroy
end
